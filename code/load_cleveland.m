%%
% Processing the heart disease dataset and building a hypergraph
% Note: attribute 14 is the class attribute (0 is healthy, and 1,2,3,4 are different
% level of non healthy)
% attriubte 15 was added: it combines the non healthy classes in 1 class (denoted by the value 1)
%%
clear all;
fid = fopen('processed.cleveland.data.txt');
C = textscan(fid, '%s','delimiter',',');
fclose(fid);

nb_attributes = 14;
c = C{1,1};
L = length(c);
N = L/nb_attributes;
data = zeros(N,nb_attributes);
names = cell(1,N);

n=1;
for i=1:L
   ii = mod(i,nb_attributes);
   if ii == 0
       n = n+1;
       if n > 303
           break;
       end
       ii = nb_attributes;
   end
   
   if strcmp(c{i},'?')
       d = NaN;
   else 
       d = str2double(c{i});
   end
   data(n,ii) = d;
    
end
 data(:,15)= (data(:,14)~=0);
 
 original = data;
 
 % dealing with feature 5 by categorizing the values (10 bins)
 data5 = data(:,5);
 d = 100;
 idx = find(data(:,5) <= d);
 data(idx,5) = d+25;
 for i=1:10
     idx = find(data5 > d);
     data(idx,5) = d+25;
     d = d + 50;
 end

 clear data5;

 % dealing with feature 1 by categorizing the values (5 bins)
 data1 = data(:,1);
 d = 29;
 idx = find(data(:,1) <= d);
 data(idx,1) = d+6;
 for i=1:5
     idx = find(data1 > d);
     data(idx,1) = d+6;
     d = d + 10;
 end
 
 clear data1;
 
  % dealing with feature 4 by categorizing the values (9 bins)
 data4 = data(:,4);
 d = 94;
 idx = find(data(:,4) < d);
 data(idx,4) = d+6;
 for i=1:9
     idx = find(data4 > d);
     data(idx,4) = d+6;
     d = d + 10;
 end
 
 clear data4;
 
 % dealing with feature 8 by categorizing the values (8 bins)
 data8 = data(:,8);
 d = 60;
 idx = find(data(:,8) <= d);
 data(idx,8) = d+10;
 for i=1:8
     idx = find(data8 > d);
     data(idx,8) = d+10;
     d = d + 20;
 end
 
  % dealing with feature 10 by categorizing the values (20 bins)
 data10 = data(:,10);
 d = -0.1;
 idx = find(data(:,10) <= d);
 data(idx,10) = d+0.1;
 for i=1:30
     idx = find(data10 >= d);
     data(idx,10) = d+0.1;
     d = d + 0.2;
 end
 
 clear data10;
 clear d;
 clear idx;
 
 % separate features from class
 class = data(:,14);
 names = data(:,15);
 data = data(:,1:end-2);
% k = [3,4,5,6,7,8,9,10,12];
% data = data(:,k);
 nb_features = size(data,2);
 
 c = 1;
for k=1:(nb_features-2)
    featureSpace = unique(data(:,k))';
    for s=featureSpace
        if ~isnan(s)
            I{c} = find(data(:,k) == s);
            if (k == 10 || k == 5 || k == 8 || k == 11) % feature 5 and 10 seem important
                w(c) = 10;
            elseif (k == 1 || k == 2) % age and sex might be irrevelant
                w(c) = 0;
            else 
                w(c) = 1;
            end
            c = c+1;
        end
    end
end

healthy = original(find(original(:,15)==0),:);
sick = original(find(original(:,15)),:);

%% using original data
%  c = 1;
% for k=1:13
%     featureSpace = unique(original(:,k))';
%     for s=featureSpace
%         if ~isnan(s)
%             I{c} = find(original(:,k) == s);
%             c = c+1;
%         end
%     end
% end
%%