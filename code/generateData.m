function [data, names,noisy] = generateData(N,C,F, featureSpace,noise,proportion)
% GENERATEDATA generates random dataset consisting of N samples from C classes with F
% features
% Usage:    N = the number of samples (int);
%           C = the number of classes (int);
%           F = the number of features (int);
%       noise = indicates if we include noise in the data


data = zeros(N,F);
delimiters  = ceil(rand(1,C-1) .* N);
delimiters(C) = N;
delimiters = sort(delimiters);



start = 1;
class = 1;
for i=delimiters % that wasnt very smart. . .
    start;
    finish = i;
    names(start:finish) = ones(finish-start+1,1).*class;
    for f=1:F
        rndF = ceil(rand(1,1) * featureSpace);
        data(start:finish,f) = ones(finish-start+1,1).*rndF;
        
        if (noise)
           noisy = addNoise(data, proportion);
        end
    end
   start = i+1; 
   class = class +1;
end

% shuffle the matrix

end