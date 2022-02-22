function PlotPCA(X, y)    
    [w, h, N] = size(X);
    xy = pca(reshape(X, w*h, []));
    
    
    size(xy)
    k = numel(unique(y));
    dim = 10;
    idx = kmeans(xy(:, 1:dim), k); 
    [Acc, ~, ~] = AccMeasure(y, idx);
    fprintf('PCA accuracy: %f\n', Acc);
    
 
    xy = xy(:, 1:2)';
    
    PlotClusters(xy, y);
    title('PCA')
end