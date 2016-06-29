function [accuracy,L1,L2,L3] = clustering_syntetic(N,I,names)

% loading data and creating the hyperedges


P = true;
v = 7;
[C1,e1,a1,L1]=zooPlot(N,I,'normalized', v,names,names,'syn_norm',P);
[CA,e2,a2,L2]=zooPlot(N,I,'unnormalizedA', v,names,names,'syn_A',P);
[CB,e3,a3,L3]=zooPlot(N,I,'unnormalizedB', v,names,names,'syn_B',P);
%[CC,e4,a4]=zooPlot(N,I,'unnormalizedC', v,names,names,'syn_C',P);

accuracy = [a1,a2,a3];

% % create corresponding hypergraph
% G = gsp_hypergraph(100,I);
% 
% % computes the eigen vector and the associated eigen values
% [V,D] = eig(G.L);
% 
% % clustering in k clusters
% k = 5;
% [IDX, C, SUMD] = kmeans(V(:,1:k), k,'Display','final');
% 
%  
% c1 = names(find(IDX==1));
% c2 = names(find(IDX==2));
% c3 = names(find(IDX==3));
% c4 = names(find(IDX==4));
% c5 = names(find(IDX==5));
%   
% % figure();
% % plot(V(find(IDX==1),3), V(find(IDX==1),2),'*',V(find(IDX==3),3), V(find(IDX==3),2),'*',V(find(IDX==4),3), V(find(IDX==4),2),'*',V(find(IDX==2),3), V(find(IDX==2),2),'*',V(find(IDX==5),3), V(find(IDX==5),2),'*');
% % figure();
% % plot(V(find(names==1),3), V(find(names==1),2),'O',V(find(names==3),3), V(find(names==3),2),'O',V(find(names==4),3), V(find(names==4),2),'O',V(find(names==2),3), V(find(names==2),2),'O',V(find(names==5),3), V(find(names==5),2),'O');
% % 
% % 
% % figure();
% % plot(V(find(IDX==1),3), V(find(IDX==1),4),'*',V(find(IDX==3),3), V(find(IDX==3),4),'*',V(find(IDX==4),3), V(find(IDX==4),4),'*',V(find(IDX==2),3), V(find(IDX==2),4),'*',V(find(IDX==5),3), V(find(IDX==5),4),'*');
% % figure();
% % plot(V(find(names==1),3), V(find(names==1),4),'O',V(find(names==3),3), V(find(names==3),4),'O',V(find(names==4),3), V(find(names==4),4),'O',V(find(names==2),3), V(find(names==2),4),'O',V(find(names==5),3), V(find(names==5),4),'O');
% 
% missClass = 0;
% for i=1:k
%     ci = names(find(IDX==i));
%    N = hist(ci);
%    missClass = missClass + (length(ci)-max(N));
% end
% 
% error = [error missClass]
% try and plot stuff :)