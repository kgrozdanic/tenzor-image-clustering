%D. Cai, X. He, Y. Hu, J. Han, and T. Huang, "Learning a Spatially Smooth Subspace for Face Recognition", in CVPR'07, 2007. ( pdf )
%===========================================
fea_Train = fea(trainIdx,:); 
gnd_Train = gnd(trainIdx); 

options = []; 
options.Metric = 'Cosine'; 
options.NeighborMode = 'Supervised'; 
options.WeightMode = 'Cosine'; 
options.gnd = gnd_Train; 
W = constructW(fea_Train,options); 

options.Regu = 1;
options.ReguAlpha = 0.1;
options.ReguType = 'Custom';
load('TensorR_32x32.mat');
options.regularizerR = regularizerR;

[eigvector, eigvalue] = LPP(W, options, fea_Train);
[eigvector, eigvalue] = LDA(gnd_Train, options, fea_Train);
...

newfea = fea*eigvector;
