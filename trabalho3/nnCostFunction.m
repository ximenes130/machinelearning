function [J grad] = nnCostFunction(nn_params, ...
                                   input_layer_size, ...
                                   hidden_layer_size, ...
                                   num_labels, ...
                                   X, y, lambda)
%   [J grad] = NNCOSTFUNCTON(nn_params, hidden_layer_size, num_labels, ...
%   X, y, lambda) calcula a função-custo e suas derivadas parciais.
%   Os parâmetros (pesos) estão contidos no vetor nn_params, e devem
%   ser convertidos em usas matrizes originais (já implementado abaixo)
% 

Theta1 = reshape(nn_params(1:hidden_layer_size * (input_layer_size + 1)), ...
                 hidden_layer_size, (input_layer_size + 1));

Theta2 = reshape(nn_params((1 + (hidden_layer_size * (input_layer_size + 1))):end), ...
                 num_labels, (hidden_layer_size + 1));

m = size(X, 1);
         
J = 0; % variável para o valor da função-custo
Theta1_grad = zeros(size(Theta1)); % matriz com as derivadas para a primeira matriz de pesos
Theta2_grad = zeros(size(Theta2)); % matriz com as derivadas para a segunda matriz de pesos

% ====================== SEU CÓDIGO AQUI ======================
% Implemente seu código em duas partes. Primeiro, implemente o código
% da função-custo sem regularização. Depois implemente o cálculo do
% termo de regularização. Em seguida, implemente o código para o cálculo
% das derivadas parciais.
%
% Dica: O vetor y passado para a função é um vetor de rótulos contendo
%       os valores de 1..K. É necessário mapear esse vetor para os valores
%       binários 0 e 1 para serem usados no cálculo da função-custo.
%


% -------------------------------------------------------------

% Convertendo y em Y
I = (num_labels);           % Gerando matriz identidade
Y = zeros(m, num_labels);   % Inicializando Y
for i=1:m
  Y(i, :) = I(y(i), :);
end

% Implementando feedforward
a1 = [ones(m, 1) X];

z2 = a1*Theta1';
a2 = [ones(size(z2, 1), 1) sigmoid(z2)];

z3 = a2*Theta2';

h = sigmoid(z3);

% calculte penalty
p = sum(sum(Theta1(:, 2:end).^2, 2))+sum(sum(Theta2(:, 2:end).^2, 2));

% Calculando custo não regularizado
J = sum(sum((-Y).*log(h) - (1-Y).*log(1-h), 2))/m + lambda*p/(2*m);

% Calculando os sigmas
sigma3 = a3.-Y;
sigma2 = (sigma3*Theta2).*sigmoidGradient([ones(size(z2, 1), 1) z2]);
sigma2 = sigma2(:, 2:end);

% accumulate gradients
delta_1 = (sigma2'*a1);
delta_2 = (sigma3'*a2);

% Regularizando gradientes
p1 = (lambda/m)*[zeros(size(Theta1, 1), 1) Theta1(:, 2:end)];
p2 = (lambda/m)*[zeros(size(Theta2, 1), 1) Theta2(:, 2:end)];
Theta1_grad = delta_1./m + p1;
Theta2_grad = delta_2./m + p2;

% =========================================================================

% Transforma as matrizes de derivadas em um único vetor
grad = [Theta1_grad(:) ; Theta2_grad(:)];

end
