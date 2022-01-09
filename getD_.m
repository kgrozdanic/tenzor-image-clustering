function [D_] = getD_(D, X, V, is_U)
    D_ = zeros(size(X{1}));

    for i = 1:length(D)
        Xi = X{i};
        
        if is_U
            Xi = Xi';
        end
        
        D_ = D_ + D(i, i) * Xi * (V * V') * Xi';
    end
end
