

%% SYNTHETIC DATA
clear all;
%create graph

featureSpace = 8;
N=100;
C=7;
F= 10;
noise = true;
proportion = 0.2;
[data, names, noisy] =  generateData(N,C,F, featureSpace, noise,proportion);

c = 1;
for k=1:F
    for s=1:featureSpace
        I{c} = find(noisy(:,k) == s);
        c = c+1;
    end
end

% clustering
 display('clustering synthetic data...')
[accuracy,L1,L2,L3] = clustering_syntetic(N,I,names);
accuracy


% classification
 display('classifying synthetic data ...')
[GA,GB,GC,GD, labels] = prepare_graphs_syn();
[eA, solA] = classify_syntetic(GA,labels,20);

[eB, solB] = classify_syntetic(GB,labels,20);

[eC, solC] = classify_syntetic(GC,labels,20);

[eD, solD] = classify_syntetic(GD,labels,20);


accuracy = [eA eB eC eD]

%% ZOO data 
clear all;

load_zoo;

% clustering
 display('clustering zoo...')
[errors2,L1,L2,L3] = clustering_zoo(N,I,names,classes);
errors

% classification
 display('classifying zoo...')
[GA,GB,GC,GD, labels] = prepare_graphs_zoo();
[eA, solA] = classify_syntetic(GA,labels,30);

[eB, solB] = classify_syntetic(GB,labels,30);

[eC, solC] = classify_syntetic(GC,labels,30);

[eD, solD] = classify_syntetic(GD,labels,30);


errors = [eA eB eC eD]



