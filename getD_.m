function [D_] = getD_(D, X, V_Vt, is_U)
    [nrow, ncol, N] = size(X);
    
    D_ = zeros( nrow, ncol );

    for i = 1:N
        Xi = X(:, :, i);
        if is_U
            Xi = Xi';
        end
        
        D_ = D_ +  D(i) * ( Xi * V_Vt * Xi' );
    end
end