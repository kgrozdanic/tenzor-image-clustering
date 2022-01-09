function [D_] = getS_(S, X, V)
    D_ = zeros(size(X));

    [nrow, ncol] = size(S);
    for i = 1:nrow
        for j = 1:ncol
            D_ = S_ + S(i, j) * X(i, :) * (V * V') * X(j, :)';
        end
    end
end