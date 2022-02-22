function PlotAccuracy(X, y, U, V, start, stop)
    acc = zeros(stop, 1);
    
    for N = start:stop
        xy = ApplyTensorImage(X, y, U, V, N, N); 
        idx = kmeans(xy, 10); 
        [Acc, ~, ~] = AccMeasure(y, idx);
        acc(N) = Acc;
    end

    figure;
    plot(start:stop, acc(start:stop), 'LineWidth', 1.2);
    
    grid on;
    
    ax1 = gca;
    set(ax1, 'Color',[0.95 0.95 0.95], 'gridcolor', [1 1 1], 'gridalpha', 1);
    
    
    xlabel('Dimenzija tenzorskog prostora')
    ylabel('Toènost (%)')
end