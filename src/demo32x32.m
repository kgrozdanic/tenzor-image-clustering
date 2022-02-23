load data/faces/Yale_32x32.mat
w = 32;
h = 32;
numPerLine = 11;
ShowLine = 2;

Y = zeros(h*ShowLine, w*numPerLine);

for i = 0:ShowLine-1
    for j = 0:numPerLine-1
        Y(i*h+1 : (i+1)*h, j*w+1 : (j+1)*w) = reshape(fea(i*numPerLine+j+1, :),[h, w]);
    end
end

imagesc(Y); colormap(gray);
daspect([1 1 1]);