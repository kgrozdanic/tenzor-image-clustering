function [X_train, y_train, X_test, y_test] = load_znamenke()
    
    load('data\znamenke\azip');
    load('data\znamenke\dzip');
    load('data\znamenke\dtest');
    load('data\znamenke\testzip');
    
    [~, n] = size(azip);
    [~, m] = size(testzip);
    
    X_train = zeros(16, 16, n);
    y_train = dzip;
    X_test = zeros(16, 16, m);
    y_test = dtest;
    
    for i = 1:n
        X_train(:, :, i) = reshape(azip(:, i), 16, 16);
        % y_train{i} = dzip(:, i);
    end
    
    for i = 1:m
        X_test(:, :, i) = reshape(testzip(:, i), 16, 16);
        % y_test{i} = dtest(:, i);
    end
    
    [~, idx] = sort(y_train);
    y_train = y_train(idx);
    X_train = X_train(:, :, idx);
    
end