function [U, V] = getUV(S, X)
    n_iter = 10;
    % stopping criteria?
    n = length(X(:, :, 1));
    D = diag(sum(S));
    
    U = eye(n); % initial
    
    for iter = 1:n_iter
        Du = getD_(D, X, U, true);
        Su = getS_(S, X, U, true);
        [V, ~] = eig(Du - Su, Du);
        
        
        Dv = getD_(D, X, V, false);
        Sv = getS_(S, X, V, false);
        [U, ~] = eig(Dv - Sv, Dv);
    end
end