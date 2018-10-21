function [J, grad] = costFunction(theta, X, y)
%COSTFUNCTION Compute cost and gradient for logistic regression
%   J = COSTFUNCTION(theta, X, y) computes the cost of using theta as the
%   parameter for logistic regression and the gradient of the cost
%   w.r.t. to the parameters.

m = length(y); % number of training examples

J = 0;
grad = zeros(size(theta));

J = sum(-y.*log(sigmoid(X*theta)) - (1-y).*log(1 - sigmoid(X*theta)))./m;

for a = 1:length(grad)
    grad(a) = sum((sigmoid(X*theta) - y).*X(:,a))./m;
end

end
