function variance = calcVariance(X, K, indexes)
  %calcVariance - Calcula a variancia dos elementos de X
  %
  % Syntax: indexes = calcVariance(X, K, indexes)

  variance = 0;

  for i = 1:size(X, 1)
    k = indexes(i);

    d = X(i,:)' - K(k,:)';
    d = d' * d;

    variance = variance + d;
  end

  variance = variance / size(X, 1);
end