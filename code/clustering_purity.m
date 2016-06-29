function p = clustering_purity(predicted_labels, true_labels)
%CLUSTERING_PURITY purity of predicted clusters given ground truth.
%   Usage: p = clustering_purity(predicted_labels, true_labels)
%           
% Average (across predicted clusters) percentage of objects belonging to
% the majority class within each cluster. That is, for each predicted
% cluster find what is the most dominant class (ground truth label) and see
% how many objects in the cluster are from this class.
%
% Note that when the number of predicted classes is big the clustering
% purity goes up.
%
% Note also that if the predicted labels assign everything to the same
% cluster we get a purity of 1/#real_classes
%
% code author: Vassilis Kalofolias
% date: July 2015

if length(predicted_labels) ~= length(true_labels)
    error('true and predicted labels have to be same length');
end

all_pred_labels = unique(predicted_labels(:))';
pred_size = zeros(length(all_pred_labels), 1);

j = 0;
for ii = all_pred_labels
    j = j + 1;
    % indices of points in a given cluster
    ind_true_cluster = (predicted_labels == ii);
    % predicted cluster and true positives
    [~, pred_size(j)] = mode(true_labels(ind_true_cluster));
end


p = sum(pred_size)/numel(predicted_labels);







