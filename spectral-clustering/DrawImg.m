function [] = DrawImg(X, A, s)
  % s je samo string za naslov da se zna koja je metoda
  [~, k] = size(X);
  
  [h, w, ~] = size(A);
  
  
  X = mod(find(X' == 1) + k-1, k) + 1;
  % X = reshape(X, h, w);
  
    
  figure()
  title(s)
%   xlabel('x koordinata')
%   ylabel('y koordinata')
 
  cmap = hsv(k);
  
  imshow(reshape(cmap(X, :), h, w, 3));
  title(s);
  drawnow;

end
