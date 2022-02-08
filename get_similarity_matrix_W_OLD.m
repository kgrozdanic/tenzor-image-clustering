%% X = h * w * N matrica slika. vraca simetricnu matricu slicnosti W.
function [W] = get_similarity_matrix_W_OLD(X)
    n = length(X);
    % ["immse", "ssim", "psnr"]
    func = "immse";
    
    W = arrayfun(@(i)agg( X(:, :, i), X(:, :, (i+1):n), func), 1:(n - 1), 'UniformOutput', false);
    
    % add padding
    W = cellfun(@(x) [zeros(1, n - numel(x)) x], W, 'un', 0);
    
    % transform to matrix
    W = cell2mat(W');
    
    % add last zero row
    W(n, :) = zeros(1, n);
    
    % W from upper tiangular => symmetric matrix
    W = triu(W) + triu(W, 1)';
    
end

%% daje slicnost izmedu x i svih elemenata 3d matrice X
function d = agg(x, X, func)
    [~, ~, N] = size(X);
    d = arrayfun(@(i)dist_func( x, X(:, :, i), func ), 1:N);
end

%% za odabranu metriku, vraca razinu slicnosti
function d = dist_func(a, b, func)
    d = 0;
    if func == "immse"
        d = 1e5 / (immse(a, b) + 1); % nije izmedu 0 - 1, ali nije zapravo niti bitno. Stavio sam 1000 zbog neke numericke stabilnosti
    elseif func == "ssim"
        d = ssim(a, b);  % izmedu 0 - 1
    elseif func == "psnr"
        d = psnr(a, b);
        d = 1 - exp(-d); % izmedu 0 - 1
    end
end