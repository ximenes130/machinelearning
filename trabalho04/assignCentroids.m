function indexes = assignCentroids(X, K)
%assignCentroids - Calcula as centroides dos grupos
%
% Syntax: indexes = assignCentroids(X, K)

indexes = zeros(size(X,1), 1);

for i = 1:size(X, 1)
  minDistance = inf;

  for k = 1:size(K, 1)
    d = X(i,:)' - K(k,:)';
    d = d' * d;

    if (d < minDistance)
      indexes(i) = k;
      minDistance = d;
    end
  end
end
