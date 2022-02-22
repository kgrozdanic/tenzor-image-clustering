function dots = Generate4(N, r1, r2)

  N = floor(N / 2);
  theta = linspace(0, 2*pi, N)';
  %sigma = 0.7; k = 2; knn = 10;

  size(r1*[cos(theta), sin(theta)])
  dots = [r1*[cos(theta), sin(theta)]+ rand(N,1); r2*[cos(theta), sin(theta)]+ rand(N,1)]';
  size(dots)
  %dots(2,:) = r2*[cos(theta),sin(theta)]+ rand(N,1);

  dots = dots(:, randperm(N * 2));

  %figure();
  %plot(dots(1,:), dots(2,:), 'x');

end