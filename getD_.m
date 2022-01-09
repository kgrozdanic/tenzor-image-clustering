function [D_] = getD_(D, X, V)
    D_ = zeros(size(X));

    for i = 1:length(D)
        D_ = D_ + D(i, i) * X(i, :) * (V * V') * X(i, :)';
    end
end
