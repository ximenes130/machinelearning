function centroids = updateCentroids(X, K, indexes)
%updateCentroids - Calcula novos centroides para os rotulos
%
% Syntax: output = updateCentroids(X, K, indexes)

centroids = zeros(size(K),2);
nums      = zeros(size(K),1);

for i = 1:size(indexes, 1)
  k               = indexes(i);
  centroids(k,:)  = centroids(k,:) + X(i,:);
  nums(k,:)       = nums(k,:) + 1;
end

centroids = centroids ./ nums;
