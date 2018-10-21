function [J, grad] = costFunctionReg(theta, X, y, lambda)
%COSTFUNCTIONREG Compute cost and gradient for logistic regression with regularization
%   J = COSTFUNCTIONREG(theta, X, y, lambda) computes the cost of using
%   theta as the parameter for regularized logistic regression and the
%   gradient of the cost w.r.t. to the parameters. 

m = length(y); % number of training examples

J = 0;
grad = zeros(size(theta));

J = sum(-y.*log(sigmoid(X*theta)) - (1-y).*log(1 - sigmoid(X*theta)))./m + (lambda/(2*m)).*(theta(2:length(theta))'*theta(2:length(theta)));

grad(1) = sum((sigmoid(X*theta) - y).*X(:,1))./m;

for a = 2:length(grad)
    grad(a) = sum((sigmoid(X*theta) - y).*X(:,a))./m + (lambda/m).*theta(a);
end

% =============================================================

end
