%  Complete os seguintes scripts
%
%     sigmoidGradient.m
%     randInitializeWeights.m
%     nnCostFunction.m

clear ; close all; clc

%% Parâmetros iniciais da RNA
input_layer_size  = 400;  % Imagem de 20x20 pixels
hidden_layer_size = 25;   % Escolha o número de neurônios da camada oculta
num_labels = 10;          % 10 classes, de 1 a 10   
                          % (note que o rótulo "0" foi mapeado como 10)

% Carrega os dados de treinamento
load('trab3data.mat');
m = size(X, 1);

% Seleciona 100 imagens aleatórias para visualização
%  sel = randperm(size(X, 1));
%  sel = sel(1:100);

%  displayData(X(sel, :));

% Um conjunto de pesos foi inicialmente estabelecida.
% Ao carregar esse arquivo, é possível debugar o script
% da função-custo

load('trab3pesos.mat');

% transforma as matrizes de pesos em um único vetor
nn_params = [Theta1(:) ; Theta2(:)];

% Para ajudar a debugar a propagação direta, use a variável
% nn_params acima. Use-a para calcular o valor da função-custo
% dos dados de entrada. Essas matrizes são provenientes de um
% treinamento prévio. O código abaixo só funcionará se o código
% da função nnCostFunction() estiver implementado.

lambda = 0;

J = nnCostFunction(nn_params, input_layer_size, hidden_layer_size, ...
                   num_labels, X, y, lambda);

fprintf(['Sua função-custo tem o valor: %f '...
         '\n(Esse valor deve ser por volta de 0.287629)\n'], J);

% O mesmo procedimento é feito para debugar a função-custo
% com regularização. Implemente o termo de regularização
% no script da função antes de executar as linhas de código
% abaixo.

lambda = 1;

J = nnCostFunction(nn_params, input_layer_size, hidden_layer_size, ...
                   num_labels, X, y, lambda);

fprintf(['Sua função-custo tem o valor: %f '...
         '\n(Esse valor deve ser por volta de 0.383770)\n'], J);

% Use a função randInitializeWeights() para criar as duas
% matrizes de pesos com valores iniciais aleatórios. Leia
% o help da função para saber como usá-la. Após isso, é
% possível iniciar o treinamento da rede chamando a função
% fminunc(). Não esqueça de transformar as matrizes de pesos
% em um único vetor. Tente diferentes valores de iterações e
% e lambda.

options = optimset('GradObj','on','MaxIter', 100);

% =========== Meu código =============

% Inicializando pesos iniciais
fprintf('\n- Inicializando pesos iniciais');
Theta1 = randInitializeWeights(input_layer_size, hidden_layer_size);
Theta2 = randInitializeWeights(hidden_layer_size, num_labels);

init_weights = [Theta1(:); Theta2(:)];

% Treinando a rede
fprintf('\n- Treinando rede utilizando função fminunc()');

costFunction = @(p) nnCostFunction(
                      p, ...
                      input_layer_size, ...
                      hidden_layer_size, ...
                      num_labels,...
                      X, y, lambda ...
                    );

[nn_params, cost] = fminunc(costFunction, init_weights, options);
                    
% Extraindo Theta1 e Theta2 a partir do nn_params
Theta1 = reshape( ...
           nn_params(1:hidden_layer_size * (input_layer_size + 1)), ...
           hidden_layer_size, ...
           (input_layer_size + 1) ...
         );

Theta2 = reshape( ...
           nn_params((1 + (hidden_layer_size * (input_layer_size + 1))):end), ...
           num_labels, ...
           (hidden_layer_size + 1) ...
         );
         
% Exibindo rede neural
fprintf('\n- Exibindo rede neural')
displayData(Theta1(:, 2:end));

% Testando nn
fprintf('\n- Predizendo Theta1 e Thera2');
pred = predict(Theta1, Theta2, X);
                    
fprintf('\nPrecisão da rede neural: %f', mean(double(pred == y)) * 100);
