# Fun��o que calcula o custo da regress�o linear
#
# Dica:
#   A fun��o custo deve receber como par�metros a matriz de dados de entrada X,
#   o vetor de valores alvo y (lembrando que a regress�o linear � um algoritmo 
#   de treinamento supervisionado) e o vetor de par�metros ?. Para facilitar, e 
#   agilizar, o c�lculo da fun��o custo, � sugerido o uso de opera��es alg�bricas 
#   no lugar de loops de repeti��o, como o for. Por isso, a matriz X deve conter 
#   uma coluna adicional na primeira posi��o, formada somente pelo valor 1. O nome 
#   do arquivo deve ser o mesmo nome da fun��o, acrescida da extens�o .m.

function [J] = cost(X, y, theta)
  m = length(y);
  J = sum((X * theta - y))./ (2 * m)
end