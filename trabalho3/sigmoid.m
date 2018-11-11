function g = sigmoid(z)
%   J = SIGMOID(z) calcula a sigmoid de z.

g = 1.0 ./ (1.0 + exp(-z));
end
