% % windows logo
A = imread('images/windows.png'); W = ImageDist(A, 0.1, 4, 1); % imagesc(W)
X = DACA(W, 5, 10); DrawImg(X, A, "DACA, Oklab");
% X = NC(W, 5); DrawImg(X, A, "NC, Oklab");
% 
A = imread('images/windows.png'); W = ImageDist(A, 0.1, 3, 0); % imagesc(W)
X = DACA(W, 5, 5); DrawImg(X, A, "DACA, rgb");
% X = NC(W, 5); DrawImg(X, A, "NC, rgb");
% 
A = imread('images/windows.png'); W = ImageDist(A, 0.03, 5, 2);%  imagesc(W)
X = DACA(W, 5, 5); DrawImg(X, A, "DACA, gray");
% X = NC(W, 5); DrawImg(X, A, "NC, gray");



A = imread('images/pablo2.jpg'); W = ImageDist(A, 0.5, 12, 1); % imagesc(W)
X = DACA(W, 5, 10); DrawImg(X, A, "DACA, Oklab");
% X = NC(W, 5); DrawImg(X, A, "NC, Oklab");

A = imread('images/pablo2.jpg'); W = ImageDist(A, 0.3, 10, 0); % imagesc(W)
X = DACA(W, 5, 10); DrawImg(X, A, "DACA, rgb");
% X = NC(W, 5); DrawImg(X, A, "NC, rgb");

A = imread('images/pablo2.jpg'); W = ImageDist(A, 0.2, 10, 2); % imagesc(W)
X = DACA(W, 5, 10); DrawImg(X, A, "DACA, gray");
% X = NC(W, 5); DrawImg(X, A, "NC, gray");


 
A = imread('images/kanye_bolji.jpg'); W = ImageDist(A, 0.35, 12, 1); imagesc(W)
X = DACA(W, 7, 10); DrawImg(X, A, "DACA, Oklab");
% X = NC(W, 5); DrawImg(X, A, "NC, Oklab");

A = imread('images/kanye_bolji.jpg'); W = ImageDist(A, 0.1, 12, 0); %imagesc(W)
X = DACA(W, 7, 10); DrawImg(X, A, "DACA, rgb");
% X = NC(W, 5); DrawImg(X, A, "NC, rgb");

A = imread('images/kanye_bolji.jpg'); W = ImageDist(A, 0.1, 12, 2); %imagesc(W)
X = DACA(W, 7, 10); DrawImg(X, A, "DACA, gray");
% X = NC(W, 5); DrawImg(X, A, "NC, gray");


A = imread('images/kanye_bolji.jpg'); W = ImageDist(A, 0.5, 10, 1); imagesc(W)
X = DACA(W, 7, 10); DrawImg(X, A, "DACA");



% A = read_image('images/kanye_bolji.jpg', 80); W = BrightnessDist(A, 4, 10, 10, 0); imagesc(W)
% A = read_image('images/kanye_bolji.jpg', 100); W = BrightnessDist(A, 3, 10, 10, 1); imagesc(W);
% X = DACA(W, 5, 10); DrawImg(X, A, "DACA, dist+gray");
