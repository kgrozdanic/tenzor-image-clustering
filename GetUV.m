function [U, V] = GetUV(S, X)
    % normalize S
    S = S - min(min(S));
    S = S / max(max(S));
    

    n_iter = 50;
    % stopping criteria?
    [nrow, ncol, N] = size(X);
    D = sum(S, 2);
      
    U = eye(nrow); % initial
    V = eye(nrow);
    
    [i_idx, j_idx, ~] = find(S);
    idxs = {};
    for i = 1:N
       idxs{i} = j_idx(find(i_idx == i)); %hmm, je li ovo upitna linija?
    end
   
    mistakes = zeros(1, n_iter);
    
    for iter = progress(1:n_iter)
        V_Vt = V * V';
        Dv = GetD_(D, X, V_Vt, false);
        Sv = GetS_(S, idxs, X, V_Vt, false);      
        [U, eigvalue_U] = eig(Dv - Sv, Dv);
        
        U_Ut = U * U';
        Du = GetD_(D, X, U_Ut, true);
        Su = GetS_(S, idxs, X, U_Ut, true);
        [V, eigvalue_V] = eig(Du - Su, Du);
        
        mistakes(iter) = abs(trace(U' * (Dv - Sv) * U) / trace(U' * Dv * U) * trace(V' * (Du - Su) * V) / trace(V' * Du * V));
    end 
        
    % [V, eigvalue_V] = SortByEig(V, eigvalue_V);
    % [U, eigvalue_U] = SortByEig(U, eigvalue_U);
    
    
    
    figure;
    plot(mistakes, 'LineWidth', 1.2);
    grid on;
    
    ax1 = gca;
    set(ax1, 'Color',[0.95 0.95 0.95], 'gridcolor', [1 1 1], 'gridalpha', 1);
    
    
    title('Funkcija cilja')
    xlabel('Iteracija')
    
    disp(mistakes(n_iter));
end