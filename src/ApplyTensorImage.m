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
        reshaped_xy = reshape(xy, 2, []);
%         figure;
%         hold on;
%         
%         n_cluster = numel(unique(y));
%     
%         cmap = hsv(n_cluster);
% 
%         for i = 1:n_cluster
%             ind = find(y == i);
%             plot(reshaped_xy(1, ind), reshaped_xy(2, ind), 'linestyle', 'none', 'Marker', '.', 'MarkerSize', 7, 'Color', cmap(i, :));
%         end
%         
%         ax1 = gca;
%         % grid on; 
%         % box on;
% 
% 
%         set(ax1, 'Color',[0.95 0.95 0.95],'gridcolor', [1 1 1], 'gridalpha', 0 ,'LineWidth', 1, 'xtick',[], 'ytick', []);

        PlotClusters(reshaped_xy, y)


        if k == 1
            title('Tensor space $$ R^1 \otimes R^2 $$', 'interpreter', 'latex');
        else
            title('Tensor space $$ R^2 \otimes R^1 $$', 'interpreter', 'latex');
        end
    end
    
    xy = reshape(xy, [], N)';
end

