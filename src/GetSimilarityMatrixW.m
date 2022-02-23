%% X = h * w * N matrica slika. vraca simetricnu matricu slicnosti W. na dijagonali 0!
function [W] = GetSimilarityMatrixW(X, func)
    [h, w, N] = size(X);
    W = zeros(N);
        
    if func == "mse"
        X = reshape(X, [], N);

        for i = 1:N
            W(i, (i+1):N) = 50 ./ log ( sum((X(:, (i+1):N) - X(:, i)) .^2, 1) );
        end
    end
    
    
    if func == "corr"
        for i = 1:N
            for j = (i+1):N
                
                W(i, j) = max( max(normxcorr2(X(:, :, i), X(:, :, j))) );
            end
        end
    end
    
    
    
    
     W = triu(W) + triu(W, 1)';
end