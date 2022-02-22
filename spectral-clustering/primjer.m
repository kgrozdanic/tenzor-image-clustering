
sigma = 1;
knn = 50;

% % % Primjer1

m1 = 100; k1 = 4;

A1 = Generate1(m1, k1);

X1_1 = NC(Dist(A1, sigma), k1);
Draw(X1_1, A1, 'Primjer1 - NC');

X1_2 = DACA(Dist(A1, sigma), k1, knn);
Draw(X1_2, A1, 'Primjer1 - DACA');


% Primjer2

m2 = 150; k21 = 2; k22 = 2; k2 = k21*k22;

A2 = Generate2(m2, k21, k22);

X2_1 = NC(Dist(A2, sigma), k2);
Draw(X2_1, A2, 'Primjer2 - NC');

X2_2 = DACA(Dist(A2, sigma), k2, knn);
Draw(X2_2, A2, 'Primjer2 - DACA');


% Primjer3

m3 = 100; k31 = 2; k32 = 2; k3 = k31*k32; knn=12; sigma=1;

A3 = Generate3(m3, k31, k32);

W = Dist(A3, sigma);

X3_1 = NC(W, k3);
Draw(X3_1, A3, 'Primjer3 - NC');

X3_2 = DACA(W, k3, knn);
Draw(X3_2, A3, 'Primjer3 - DACA');


% % Primjer4
N = 300; r1 = 2; r2 = 6; k = 2; sigma = 1.5;
A4 = Generate4(N, r1, r2);

X4_1 = NC(Dist(A4, sigma), k);
Draw(X4_1, A4, 'Primjer4 - NC');

X4_2 = DACA(Dist(A4, sigma), k, knn); 
Draw(X4_2, A4, 'Primjer4 - DACA');