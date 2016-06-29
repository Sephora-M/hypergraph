function [C,accuracy] = clevelandPlot(N,I,lapType,w, nbEigVect,names,classes,figName)

G = gsp_hypergraph(N,I, lapType,w);
G.N

G = gsp_compute_fourier_basis(G);
% computes the eigen vector and the associated eigen values
V = G.U;

% clustering in k clusters

k = 2;
[IDX, C, SUMD] = kmeans(V(:,2:nbEigVect), k,'Display','final');

c1 = names(find(IDX==1));
c2 = names(find(IDX==2));
  
h(1)=figure();

for i=0:1
    plot(V(find(classes==i),2), V(find(classes==i),3),'*');
    hold on
end

h(3)=figure();

for i=0:2
    plot(V(find(IDX==i),2), V(find(IDX==i),3),'*');
    hold on
end
    
%plot(V(find(classes==1),3), V(find(classes==1),2),'*',V(find(classes==3),3), V(find(classes==3),2),'*',V(find(classes==4),3), V(find(classes==4),2),'*',V(find(classes==2),3), V(find(classes==2),2),'*',V(find(classes==5),3), V(find(classes==5),2),'*',V(find(classes==6),3), V(find(classes==6),2),'*',V(find(classes==7),3), V(find(classes==7),2),'*' );
%text(0.0001+V(:,3), 0.0001+V(:,2),names);

h(2)=figure();

for i=0:1
    plot(V(find(classes==i),3), V(find(classes==i),4),'*');
    hold on
end

%plot(V(find(classes==1),3), V(find(classes==1),4),'*',V(find(classes==3),3), V(find(classes==3),4),'*',V(find(classes==4),3), V(find(classes==4),4),'*',V(find(classes==2),3), V(find(classes==2),4),'*',V(find(classes==5),3), V(find(classes==5),4),'*',V(find(classes==6),3), V(find(classes==6),4),'*',V(find(classes==7),3), V(find(classes==7),4),'*' );
%text(0.0001+V(:,3), 0.0001+V(:,4),names);

C = {c1 ; c2};


%savefig(h,strcat(figName,'_V3-V2_and_V3-V4.fig'));
%close(h)


missClass = 0;
for i=1:k
    ci = classes(find(IDX==i));
   Nc = hist(ci);
   missClass = missClass + (length(ci)-max(Nc));
end

error = missClass/N;
accuracy = clustering_purity(IDX, classes);