function [U, V] = getUV(S, X)
    n_iter = 10;
    % stopping criteria?
    n = len(S);
    D = diag(sum(S));    
    
    U = eye(n); % initial
    
    for iter = 1:n_iter
        Dv = getD_(D, X, V);
        Sv = getS_(S, X, V);
        [U, ~] = eig(Dv - Sv, Dv);
        
        Du = getD_(D, X, U);
        Su = getS_(S, X, U);
        [V, ~] = eig(Du - Su, Du);
    end
end