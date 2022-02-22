% Primjer1

k1 = 4;
sigma = 5;
knn = 20;
A1 = Generate1(40, k1);

X1_1 = MSC(Dist(A1, sigma), k1);
Draw(X1_1, A1, 'Primjer1 - MSC');

X1_2 = DACA(Dist(A1, sigma), k1, knn);
Draw(X1_2, A1, 'Primjer1 - DACA');


% Primjer2

k21 = 2; k22 = 2; k2 = k21*k22;
A2 = Generate2(100, k21, k22);

X2_1 = MSC(Dist(A2, sigma), k2);
Draw(X2_1, A2, 'Primjer2 - MSC');

X2_2 = DACA(Dist(A2, sigma), k2, knn);
Draw(X2_2, A2, 'Primjer2 - DACA');

% Primjer3

k31 = 2; k32 = 2; k3 = k31*k32;
A3 = Generate3(50, k31, k32);
X3_1 = MSC(Dist(A3, sigma), k3);
Draw(X3_1, A3, 'Primjer3 - MSC');

X3_2 = DACA(Dist(A3, sigma), k3, knn);
Draw(X3_2, A3, 'Primjer3 - DACA');

% Primjer4 cirkularni
N = 300; r1 = 2; r2 = 4; theta = linspace(0, 2*pi, N)';
sigma = 0.7; k = 2; knn = 10;
A1 = r1*[cos(theta),sin(theta)]+ rand(N,1); 
A2 = r2*[cos(theta),sin(theta)]+ rand(N,1);
A = [A1;A2]'; % Noisy 2-D circular data set
A = A(:, randperm(N*2));

X = MSC(Dist(A, sigma), k);
Draw(X, A, 'Primjer4 - MSC');

X = DACA(Dist(A, sigma), k, knn);
Draw(X, A, 'Primjer4 - DACA');