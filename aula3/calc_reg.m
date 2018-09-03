function [J] = calc_reg(X, y, theta)
  m = length(y);
  J = sum((X * theta - y)./ (2 * m))
end