clear all;

fid = fopen('processed.switzerland.data.txt');
C = textscan(fid, '%s','delimiter',',');
fclose(fid);

na = 17;
N = 101;
data = zeros(na,N);
names = cell(1,N);

attributes = [1,2,3,4,5,8,9,10,11,14];
skip = [3,118];

for ii=1:N
    if isempty(find(skip==ii))
        data(:,ii) = str2num(cell2mat(C{1}(attributes+(ii-1)*14)));
        names{1,ii} = C{1}((1)+(ii-1)*18);
        
    end
end