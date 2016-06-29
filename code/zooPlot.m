function [C,error,accuracy, L] = zooPlot(N,I,lapType, nbEigVect,names,classes,figName,P)

G = gsp_hypergraph(N,I, lapType);

G = gsp_compute_fourier_basis(G);
% computes the eigen vector and the associated eigen values
V = G.U;
L = G.L;

%[V,D] = eigs(L);
% clustering in k clusters

k = 7;
[IDX, C, SUMD] = kmeans(V(:,2:nbEigVect), k,'Display','final');

c1 = names(find(IDX==1));
c2 = names(find(IDX==2));
c3 = names(find(IDX==3));
c4 = names(find(IDX==4));
c5 = names(find(IDX==5));
c6 = names(find(IDX==6));
c7 = names(find(IDX==7));

if P
    h(1)=figure();
    
    for i=1:k
        plot(V(find(classes==i),2), V(find(classes==i),3),'*');
        
        hold on
    end
    %text(0.0001+V(:,2), 0.0001+V(:,3),names);
    %plot(V(find(classes==1),3), V(find(classes==1),2),'*',V(find(classes==3),3), V(find(classes==3),2),'*',V(find(classes==4),3), V(find(classes==4),2),'*',V(find(classes==2),3), V(find(classes==2),2),'*',V(find(classes==5),3), V(find(classes==5),2),'*',V(find(classes==6),3), V(find(classes==6),2),'*',V(find(classes==7),3), V(find(classes==7),2),'*' );
    
    
    
    h(2)=figure();
    
    for i=1:k
        plot(V(find(classes==i),3), V(find(classes==i),4),'*');
        
        hold on
    end
    %text(0.0001+V(:,3), 0.0001+V(:,4),names);
    %plot(V(find(classes==1),3), V(find(classes==1),4),'*',V(find(classes==3),3), V(find(classes==3),4),'*',V(find(classes==4),3), V(find(classes==4),4),'*',V(find(classes==2),3), V(find(classes==2),4),'*',V(find(classes==5),3), V(find(classes==5),4),'*',V(find(classes==6),3), V(find(classes==6),4),'*',V(find(classes==7),3), V(find(classes==7),4),'*' );
    
end
C = {c1 ; c2; c3; c4; c5; c6;c7};


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