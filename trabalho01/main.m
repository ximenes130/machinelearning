clear;
clc;

# Carregando arquivos de treino disponibilizados pelo professor
data = load('data.txt');

# Extraindo informa��es da matriz fornecida
X = [ones(length(data), 1) data(:, 1:2)];
y = data(:, 3);

# Calculando o Theta
theta = descending_gradient(X, y, [1 1000 2]', 0.0001, 300);

# Calculando a hip�tese
t = [ones(1, 6) ; 0:1000:5000 ; 0:1:5];
h = theta(1) .* t(1,:) + theta(2) .* t(2,:) + theta(3) .* t(3,:);

# Imprimindo dados
plot3(data(:,1),data(:,2),data(:,3), '*');
xlabel('M�');
ylabel('Qtd quartos');
zlabel('Custo');

hold on;
plot3(t(2,:), t(3,:), h, '-');
hold off

# Imprimindo teste
# [1650 3] => $293.081,46
x_teste = [1 1650 3]';
printf('\n-----------\n\nestimativa do pre�o de uma casa com �rea de 1.650 p�s quadrados e 3 quartos. O pre�o estimado deve ser, aproximadamente, $ 293.081,46.\n');
h = theta(1) .* x_teste(1,:) + theta(2) .* x_teste(2,:) + theta(3) .* x_teste(3,:)


