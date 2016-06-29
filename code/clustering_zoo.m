function [errors2,L1,L2,L3] = clustering_zoo(N,I,names,classes)
% loading data and creating the hyperedges
%load_zoo;

% create corresponding hypergraph first using 
P = true;
v = 7;
[C1,e1,a1,L1]=zooPlot(N,I,'normalized', v,names,classes,'zoo_norm',P);
[CA,e2,a2,L2]=zooPlot(N,I,'unnormalizedA', v,names,classes,'zoo_A',P);
[CB,e3,a3,L3]=zooPlot(N,I,'unnormalizedB', v,names,classes,'zoo_B',P);
%[CC,e4,a4,L4]=zooPlot(N,I,'unnormalizedC', v,names,classes,'zoo_C',P);


errors2  = [1-a1,1-a2,1-a3];