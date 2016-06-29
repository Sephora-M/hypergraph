function [GA,GB,GC,GD, labels] = prepare_graphs_syn()

%%  syn

featureSpace = 9;
N=500;
C=7;
F= 25;
noise = true;
proportion = 0.3;
[data, labels, noisy] =  generateData(N,C,F, featureSpace, noise,proportion);

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