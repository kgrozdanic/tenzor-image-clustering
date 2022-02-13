function [U, V] = getUV(S, X)
    n_iter = 30;
    % stopping criteria?
    [nrow, ncol, N] = size(X);
    D = sum(S, 2);
      
    U = eye(nrow); % initial
    V = eye(nrow);
    
    [i_idx, j_idx, ~] = find(S);
    idxs = {};
    for i = 1:N
       idxs{i} = j_idx(find(i_idx == i)); 
    end
   
    mistakes = zeros(1, n_iter);
    
    for iter = progress(1:n_iter)
        V_Vt = V * V';
        Dv = getD_(D, X, V_Vt, false);
        Sv = getS_(S, idxs, X, V_Vt, false);      
        [U, eigvalue_U] = eig(Dv - Sv, Dv);
        
        U_Ut = U * U';
        Du = getD_(D, X, U_Ut, true);
        Su = getS_(S, idxs, X, U_Ut, true);
        [V, eigvalue_V] = eig(Du - Su, Du);
        
        mistakes(iter) = abs(trace(U' * (Dv - Sv) * U) / trace(U' * Dv * U) * trace(V' * (Du - Su) * V) / trace(V' * Du * V));
    end 
    
    % [V, eigvalue_V] = sort_by_eig(V, eigvalue_V);
    % [U, eigvalue_U] = sort_by_eig(U, eigvalue_U);
    
    plot(mistakes);
    disp(mistakes(n_iter));
end