clear all;

% loading data and creating the hyperedges
load_zoo;

% create corresponding hypergraph
G = gsp_hypergraph(101,I);

% computes the eigen vector and the associated eigen values
[V,D] = eig(G.L);

% clustering in k clusters
k = 5;
 [IDX, C, SUMD] = kmeans(V(:,1:k), k,'Display','final');

 
c1 = names(find(IDX==1));
c2 = names(find(IDX==2));
c3 = names(find(IDX==3));
c4 = names(find(IDX==4));
c5 = names(find(IDX==5));
  

% try and plot stuff :)