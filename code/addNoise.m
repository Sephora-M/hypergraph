function noise = addNoise(data, proportion)
noise = data;
[m,n] = size(noise);

featureSpace = unique(noise);

for i=1:m
    for j=1:n
       if rand() <= proportion
           initVal = noise(i,j);
           while noise(i,j) == initVal 
               idx = ceil(rand()*length(featureSpace));
                noise(i,j) = featureSpace(idx);
           end
       end
        
    end

end
