function[ error sol] = classify_syntetic(G,labels, numKnown)
N = length(labels);   
M = zeros(N,1);
M(1:numKnown) = 1; 
sol = gsp_classification_tik(G ,M, labels );

missClassified = length(find(sol(numKnown+1:end) ~= labels(numKnown+1:end) ));

error = missClassified/(N-numKnown);

end