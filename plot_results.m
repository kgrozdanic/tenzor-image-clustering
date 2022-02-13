function [] = plot_results(X, y, U, V, k, m)
    [h, w, N] = size(X);
    
    xy = zeros(2, N); % k*m = 2
    n_cluster =  numel(unique(y));
    
    cmap = hsv(n_cluster);


    for i = 1:N
       u = U(:, 1:k);
       v = V(:, 1:m);
       xy(:, i) = u' * X(:, :, i) * v;
    end
    
    hold on;

      
    for i = 1:n_cluster
        ind = find(y == i);
        plot(xy(1, ind), xy(2, ind), 'linestyle', 'none', 'Marker', '.', 'MarkerSize', 7, 'Color', cmap(i, :))
    end
    
    % ax1 = gca;
    % grid on; box on;
    % set(ax1, 'Color',[1 1 0.99],'gridcolor', [0 0 0], 'gridalpha', 0.23 ,'LineWidth', 1);
 
end