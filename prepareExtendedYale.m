% path = 'E:\PMF\4.godina\USPP\tenzor-image-clustering\data\faces\CroppedYale';
% files = dir(path);
% subFolders = files([files.isdir]);
% subFolderNames = {subFolders(3:end).name};
% 
% [~, n] = size(subFolderNames);
% 
% testFolder = strcat(strcat(path, '\'), subFolderNames{1});
% nSamples = dir(fullfile(testFolder,'*.pgm'));
% images = cell(size(nSamples));
% for i = 1:numel(nSamples)
%     images{i} = imread(fullfile(testFolder, nSamples(i).name));
% end
%     

load('data\faces\YaleB_32x32.mat');
load('data\faces\50Train\1.mat'); %first random split


%preprocessing
% Nomalize each vector to unit
[nSmp, ~] = size(fea);
for i = 1:nSmp
     fea(i,:) = fea(i,:) ./ max(1e-12,norm(fea(i,:)));
end

% Scale the features (pixel values) to [0,1]
maxValue = max(max(fea));
fea = fea/maxValue;

fea_Train = fea(trainIdx,:);
fea_Test = fea(testIdx,:);

y_train = gnd(trainIdx);
y_test = gnd(testIdx);

[n, ~] = size(trainIdx);
[m, ~] = size(testIdx);
X_train = zeros(32, 32, n);
X_test = zeros(32, 32, m);

for i = 1:n
    X_train(:, :, i) = reshape(fea_Train(i, :), 32, 32);
    % y_train{i} = dzip(:, i);
end

for i = 1:m
    X_test(:, :, i) = reshape(fea_Test(i, :), 32, 32);
    % y_test{i} = dtest(:, i);
end

idx = find(y_train <= 11);
y_train = y_train(idx);
X_train = X_train(:, :, idx);

idx = find(y_test <= 11);
y_test = y_test(idx);
X_test = X_test(:, :, idx);

[~, idx] = sort(y_train);
y_train = y_train(idx);
X_train = X_train(:, :, idx);