function [GA,GB,GC,GD, labels] = prepare_graphs_zoo()

%%  syn

% featureSpace = 9;
% N=500;
% C=7;
% F= 25;
% noise = true;
% proportion = 0.3;
% [data, labels, noisy] =  generateData(N,C,F, featureSpace, noise,proportion);

%% zoo
load_zoo

noisy = data';
[N,F] = size(noisy);
labels = classes;
featureSpace = 8;

%% binary classification : 1 vs not 1
% noisy1 = noisy(find(labels==1),:);
% s1 = size(noisy1,1);
% noisy2 = noisy(find(labels~=1),:);
% s2 = size(noisy2,1);
% noisy = [noisy1; noisy2];
% labels = [ones(s1,1);ones(s2,1).*2]';
%% classification of classes 2-7

%noisy = noisy(find(labels~=1),:);
%labels = labels(find(labels~=1));

%%
Noisy = [noisy labels'];

shuffledData = Noisy(randperm(size(Noisy,1)),:);

noisy = shuffledData(:,1:end-1);
labels = shuffledData(:,end);
c = 1;
for k=1:F
    for s=0:featureSpace
        I{c} = find(noisy(:,k) == s);
        c = c+1;
    end
end



GA = gsp_hypergraph(N,I, 'unnormalizedA');
GA = gsp_compute_fourier_basis(GA);

GB = gsp_hypergraph(N,I, 'unnormalizedB');
GB = gsp_compute_fourier_basis(GB);

GC = gsp_hypergraph(N,I, 'unnormalizedC');
GC = gsp_compute_fourier_basis(GC);

GD = gsp_hypergraph(N,I, 'normalized');
GD = gsp_compute_fourier_basis(GD);
end