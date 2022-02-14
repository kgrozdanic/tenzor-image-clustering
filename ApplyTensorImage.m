function [xy] = ApplyTensorImage(X, y, U, V, k, m)
    [h, w, N] = size(X);

    xy  = zeros(k, m, N);
    for i = 1:N
       u = U(:, 1:k);
       v = V(:, 1:m);
       xy(:, :, i) = u' * X(:, :, i) * v;
    end
    
    % ako mozes prikazati u 2d, onda prikazi
    if k * m <= 2
        hold on;
        
        n_cluster = numel(unique(y));
    
        cmap = hsv(n_cluster);
        reshaped_xy = reshape(xy, 2, []);
        size(reshaped_xy(:, 2))

        for i = 1:n_cluster
            ind = find(y == i);
            plot(reshaped_xy(1, ind), reshaped_xy(2, ind), 'linestyle', 'none', 'Marker', '.', 'MarkerSize', 7, 'Color', cmap(i, :))
        end
    end
end
