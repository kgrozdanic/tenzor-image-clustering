function [eigvector, eigvalue, elapse] = IsoP(options, data)
% IsoP: Isometric Projection
%
%       [eigvector, eigvalue, elapse] = IsoP(options, data)
% 
%             Input:
%               data    - Data matrix. Each row vector of data is a data point.
%
%               options - Struct value in Matlab. The fields in options
%                         that can be set:
%
%                      NeighborMode -  Indicates how to construct the graph. Choices
%                           are: 
%                           'KNN'     -  Put an edge between two nodes if and
%                                        only if they are among the k nearst
%                                        neighbors of each other. Default
%                                        option.
%                       'Supervised'  -  Two variations:
%                                       1. k=0, Put an edge between two nodes 
%                                          if and only if they belong to
%                                          same class. 
%                                       2. k>0, The distance between two nodes 
%                                          in the same class will be smaller than 
%                                          two nodes have diff. labels 
%                                          The label information 'gnd' should be
%                                          provided.
%                                              
%                       k           -   The number of neighbors.
%                                       Default k = 5;
%                       gnd         -   The parameter needed under 'Supervised'
%                                       NeighborMode.  Colunm vector of the label
%                                       information for each data point.
%
%                         Please see LGE.m for other options.
%
%
%             Output:
%               eigvector - Each column is an embedding function, for a new
%                           data point (row vector) x,  y = x*eigvector
%                           will be the embedding result of x.
%               eigvalue  - The eigvalue of LPP eigen-problem. sorted from
%                           smallest to largest. 
%               elapse    - Time spent on different steps 
% 
%
%    Examples:
%
%       
%       
%       fea = rand(50,70);
%       gnd = [ones(10,1);ones(15,1)*2;ones(10,1)*3;ones(15,1)*4];
%       options = [];
%       options.k = 0;
%       options.NeighborMode = 'Supervised';
%       options.gnd = gnd;
%       [eigvector, eigvalue] = IsoP(options, fea);
%       Y = fea*eigvector;
% 
% 
%
% See also LPP, LGE
%
%Reference:
%
%   Deng Cai, Xiaofei He, and Jiawei Han, "Isometric Projection",
%   Twenty-Second Conference on Artificial Intelligence (AAAI-07), 2007
%
%   Deng Cai, Xiaofei He and Jiawei Han, "Isometric Projection", Technical
%   report, Computer Science Department, UIUC, UIUCDCS-R-2006-2747, July 2006  
%
%   Joshua B. Tenenbaum, Vin de Silva, and John C. Langford. "A Global
%   Geometric Framework for Nonlinear Dimensionality Reduction", Science,
%   v.290 no.5500 , Dec.22, 2000. pp.2319-2323. 
%
%
%   version 2.1 --June/2007 
%   version 2.0 --May/2007 
%   version 1.1 --May/2006 
%   version 1.0 --Nov/2005 
%
%   Written by Deng Cai (dengcai2 AT cs.uiuc.edu)

INFratio = 1000;
nBlock = 4000;


bGlobal = 0;
if ~exist('data','var')
    bGlobal = 1;
    global data;
end

if (~exist('options','var'))
   options = [];
end

if ~isfield(options,'NeighborMode')
    options.NeighborMode = 'KNN';
end

if ~isfield(options,'k') 
    options.k = 5;
end

[nSmp,nFea] = size(data);

if options.k >= nSmp
    error('k is too large!');
end

tmp_T = cputime;

if options.k <= 0  % Always supervised!
    if ~isfield(options,'gnd')
        error('gnd should be provided!');
    end
    if length(options.gnd) ~= nSmp
        error('gnd and data mismatch!');
    end
    
    Label = unique(options.gnd);
    nLabel = length(Label);

    G = zeros(nSmp,nSmp);
    for i=1:nLabel
        classIdx = find(options.gnd==Label(i));
        D = EuDist2(data(classIdx,:),[],1);
        G(classIdx,classIdx) = D;
    end
    maxD = max(max(G));
    INF = maxD*INFratio;  % effectively infinite distance
    
    D = INF*ones(nSmp,nSmp);
    for i=1:nLabel
        classIdx = find(options.gnd==Label(i));
        D(classIdx,classIdx) = G(classIdx,classIdx);
    end
    
    clear G
else
    switch lower(options.NeighborMode)
        case {lower('KNN')}
            D = EuDist2(data);
            maxD = max(max(G));
            INF = maxD*INFratio;  % effectively infinite distance
            
            [dump,iidx] = sort(D,2);
            iidx = iidx(:,(2+options.k):end);
            I = repmat([1:nSmp]',size(iidx,2),1);
            J = iidx(:);
            D(I,J) = 0;
            
            D = dijkstra(D, 1:nSmp);

            D = reshape(D,nSmp*nSmp,1);
            infIdx = find(D==inf);
            if length(infIdx) > 0
                D(infIdx) = INF;
            end
            D = reshape(D,nSmp,nSmp);

        case {lower('Supervised')}
            if ~isfield(options,'gnd')
                error('gnd should be provided!');
            end
            if length(options.gnd) ~= nSmp
                error('gnd and data mismatch!');
            end

            Label = unique(options.gnd);
            nLabel = length(Label);


            G = zeros(nSmp,nSmp);
            for idx=1:nLabel
                classIdx = find(options.gnd==Label(idx));
                nSmpClass = length(classIdx);
                D = EuDist2(data(classIdx,:),[],1);
                if options.k >= nSmpClass
                    G(classIdx,classIdx) = D;
                else
                    [dump,iidx] = sort(D,2);
                    iidx = iidx(:,(2+options.k):end);
                    I = repmat([1:nSmpClass]',size(iidx,2),1);
                    J = iidx(:);
                    D(I,J) = 0;
                    D = dijkstra(D, 1:nSmpClass);
                    G(classIdx,classIdx) = D;
                end
            end
            
            maxD = max(max(G));
            INF = maxD*INFratio;  % effectively infinite distance

            D = INF*ones(nSmp,nSmp);
            for i=1:nLabel
                classIdx = find(options.gnd==Label(i));
                D(classIdx,classIdx) = G(classIdx,classIdx);
            end
            clear G

        otherwise
            error('NeighborMode does not exist!');
    end
end


S = D.^2;
sumS = sum(S);
H = sumS'*ones(1,nSmp)/nSmp;
TauDg = -.5*(S - H - H' + sum(sumS)/(nSmp^2));

TauDg = max(TauDg,TauDg');

timeW = cputime - tmp_T;

%==========================
% If data is too large, the following centering codes can be commented
%==========================
if isfield(options,'keepMean') & options.keepMean
    ;
else
    if issparse(data)
        data = full(data);
    end
    sampleMean = mean(data);
    data = (data - repmat(sampleMean,nSmp,1));
end
%==========================


if bGlobal & isfield(options,'keepMean') & options.keepMean
    [eigvector, eigvalue, elapse] = LGE(TauDg, [], options);
else
    [eigvector, eigvalue, elapse] = LGE(TauDg, [], options, data);
end

elapse.timeW = timeW;
elapse.timeAll = elapse.timeAll + elapse.timeW;


eigIdx = find(eigvalue < 1e-3);
eigvalue (eigIdx) = [];
eigvector(:,eigIdx) = [];

