function [S_] = getS_(S, idxs, X, V_Vt, is_U)
    [nrow, ncol, N] = size(X);
    S_ = zeros(nrow, ncol);
    
    for i = 1:N      
        curr_idxs = idxs{i};
        for idx = 1:length(curr_idxs)
            j = curr_idxs(idx);
            Xi = X(:, :, i);  Xj = X(:, :, j);
            
            if is_U
                Xi = Xi';  Xj = Xj';
            end
            
            S_ = S_ + S(i, j) * Xi * V_Vt * Xj';
        end
    end
end