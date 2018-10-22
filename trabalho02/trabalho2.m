clear; clc;

fprintf('------ Inicializando script ------\n')

load('data.mat');
len = size(X, 1);
fprintf('Arquivo lido, tamanho = %d\n', len)

% Extraindo base de validação
posicao = round(len * 0.75);
V = X(posicao:len, :);
v = y(posicao:len, :);
X = X(1:(posicao-1), :);
y = y(1:(posicao-1), :);
fprintf('Bases separadas,\n\ttamanho da base de treino = %d\n\ttamanho da base de validacao = %d\n', posicao, (len - posicao))

% Inicializando Thetas
fprintf('Inicializando thetas\n')
initial_theta = zeros(size(X, 2), 1);

% Set regularization parameter lambda to 1
lambda = 1;

% Computando custo e gradiente
fprintf('Computando custo e gradiente\n')
[cost, grad] = costReg(initial_theta, X, y, lambda);

% Configurando equação
fprintf('Configurando equação\n')
options = optimset('GradObj', 'on', 'MaxIter', 400);

% Otimizando equação
fprintf('Otimizando equação\n')
[theta, J, exit_flag] = ...
	fminunc(@(t)(costReg(t, X, y, lambda)), initial_theta, options);

% Predizendo resultado
fprintf('Predizendo resultado\n')
p = sigmoid(V*theta)>=0.5;

fprintf('Precisão alcançada: %02.2f\n', p * 100)
