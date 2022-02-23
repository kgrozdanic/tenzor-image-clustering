function PlotClusters(xy, y)    
    figure;
    hold on;

    n_cluster = numel(unique(y));

    cmap = hsv(n_cluster);
    reshaped_xy = reshape(xy, 2, []);

    for i = 1:n_cluster
        ind = find(y == i);
        plot(reshaped_xy(1, ind), reshaped_xy(2, ind), 'linestyle', 'none', 'Marker', '.', 'MarkerSize', 7, 'Color', cmap(i, :));
    end

    ax1 = gca;
    % grid on; 
    % box on;


    set(ax1, 'Color',[0.95 0.95 0.95],'gridcolor', [1 1 1], 'gridalpha', 0 ,'LineWidth', 1, 'xtick',[], 'ytick', []);
end