clear; clc;

load ex2data2.txt;

X = ex2data2(:,1:2);
y = ex2data2(:,3);

% plotData(X,y);

% input layer has the same size of number of variables
layer1 = size(X,2);
% hidden layer can vary in size
layer2 = 10;
% output layer has the number of classes
layer3 = size(y,2);

Theta1 = randInitializeWeights(layer1,layer2);
Theta2 = randInitializeWeights(layer2,layer3);

init_weights = [Theta1(:); Theta2(:)];

options = optimset('GradObj', 'on','MaxIter', 100);
% options = optimset('MaxIter', 100);

%  You should also try different values of lambda
lambda = 0.5;

% Create "short hand" for the cost function to be minimized
costFunction = @(p) nnCostFunction(p,layer1,layer2,layer3, X, y, lambda);

% Now, costFunction is a function that takes in only one argument (the
% neural network parameters)
[nn_params, cost] = fminunc(costFunction, init_weights, options);

% Obtain Theta1 and Theta2 back from nn_params
Theta1 = reshape(nn_params(1:layer2 * (layer1 + 1)), layer2, (layer1 + 1));

Theta2 = reshape(nn_params((1 + (layer2 * (layer1 + 1))):end), ...
                 layer3, (layer2 + 1));

pred = predict(Theta1, Theta2, X);

% fprintf('\nTraining Set Accuracy: %f\n', mean(double(pred == y)) * 100);

plotDecisionBoundary(Theta1, Theta2,X,y);