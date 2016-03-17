%% Demo hypergraph

% clear;
% close all;

fid = fopen('zoo.data.txt');
C = textscan(fid, '%s','delimiter',',');
fclose(fid);

na = 17;
N = 101;
data = zeros(na,N);
names = cell(1,N);

for ii=1:N
 data(:,ii) = str2num(cell2mat(C{1}((2:18)+(ii-1)*18)))
 names{1,ii} = C{1}((1)+(ii-1)*18);
end

%% now we remap to 24 BINARY attributes by unfolding the numeric ones

H = zeros(28,101);

H(1:12,:) = data(1:12,:);

H(13,:) = (data(13,:) == 0);
H(14,:) = (data(13,:) == 2);
H(15,:) = (data(13,:) == 4);
H(16,:) = (data(13,:) == 5);
H(17,:) = (data(13,:) == 6);
H(18,:) = (data(13,:) == 8);

H(19:21,:) = data(14:16,:);

H(22,:) = (data(17,:) == 1);
H(23,:) = (data(17,:) == 2);
H(24,:) = (data(17,:) == 3);
H(25,:) = (data(17,:) == 4);
H(26,:) = (data(17,:) == 5);
H(27,:) = (data(17,:) == 6);
H(28,:) = (data(17,:) == 7);

%% Now make a cell array of hyperedges

for k=1:28
    I{k} = find(H(k,:));
end





