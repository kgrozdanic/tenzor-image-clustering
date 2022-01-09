function [S_] = getS_(S, X, V, is_U)
    [nrow, ncol] = size(X{1});    
    S_ = zeros(nrow, ncol);
    
    for i = 1:nrow
        for j = 1:ncol
            Xi = X{i};  Xj = X{j};
            
            if is_U
                Xi = Xi';  Xj = Xj';
            end
            
            S_ = S_ + S(i, j) * Xi * (V * V') * Xj';
        end
    end
end