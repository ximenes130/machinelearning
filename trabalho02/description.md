# Trabalho 02

O objetivo do segundo trabalho é familiarizar o(a) aluno(a) com a regressão logística.

Nesse trabalho, o(a) aluno(a) irá implementar um programa computacional de regressão logística de múltiplas variáveis, utilizando um algoritmo optimizado para estimação dos parâmetros.

### Dados 
Foram coletadas imagens digitalizadas de caracteres numéricos de 0 a 9 escritos a mão. Imagens digitais são formadas por um número finito de pixels, onde cada pixel representa um ponto na imagem, com valores numéricos de 0, representando a cor preta, a 255, representando a cor branca. Os valores intermediários representam tons de cinza em uma escala progressiva. 

Esses dados estão disponíveis no arquivo “data.mat”, o qual contém amostras de 5000 imagens com 20 pixels por dimensão, significando que cada imagem possui 400 pixels. Ao carregar o arquivo de dados no Matlab/Octave, as imagens já estarão disponíveis na forma de vetor, ou seja, cada imagem está representada em um único vetor linha com 400 elementos, onde cada elemento do vetor corresponde ao valor numérico de cada pixel da imagem, e o conjunto total de dados de treinamento será formado pela matriz X de dimensões 5000 x 400.

Por ser um problema de classificação usando um algoritmo de treinamento supervisionado, as classes correspondentes a cada caracter são fornecidas no vetor y, incluído em data.mat. A ordem dos elementos de y corresponde à mesma ordem das linhas de X, portanto, a primeira linha de X conterá os pixels de uma imagem, e o primeiro elemento de y terá a classe ao qual essa imagem corresponde. O vetor y, portanto, terá seus elementos com os valores correspondentes a cada caracter numérico, assim, se a imagem de índice 3500 representa o caracter 7, por exemplo, então y (3500) = 7. A única exceção são imagens correspondendo ao caracter 0 (zero), que terão o valor numérico correspondente no vetor y iguais a 10. Isso facilita a criação do vetor de treinamento e impede codificação extra, visto que o Matlab/Octave tem os índices de suas matrizes iniciando em 1 (um).

Esses, e muitos outros dados de exemplo, estão disponíveis no site The Data and Story Library (http://lib.stat.cmu.edu/DASL).

### Problema 
Deseja-se treinar um algoritmo que consiga reconhecer uma imagem digital de 20 x 20 pixels em tons de cinza em diferentes valores numéricos. Cada pixel de uma imagem corresponde a uma variável do problema, logo, a regressão logística terá 401 parâmetros (incluindo θ 0 ). Devido ao alto número de variáveis, pode-se usar a combinação linear entre X e θ.

Para efeito de visualização, foi disponibilizado a função displayData( ), que mostrará 100 imagens da tabela de treinamento.

A escolha de qual algarismo deverá ser reconhecido pelo modelo logístico, deve ser feita pelo usuário, por isso, seu algoritmo deve ser flexível para receber a escolha de qual caracter será usado para treinamento.

O trabalho deve ser constituído por 3 (três) arquivos Matlab/Octave (com extensão .m) distintos. Um deles já foi disponibilizado (trabalho2.m), e deve ser preenchido pelo(a) aluno(a) a fim de cumprir o requisitado.

São eles:
- O script principal trabalho2.m, que deverá ser executado para realizar a regressão logística;
- Um script de função para cálculo da função sigmoid;
- Um script de função para cálculo da função custo e suas derivadas. Todos os cálculos devem ser regularizados.


### Dicas 
A função sigmoid deve receber um parâmetro de entrada e retornar um valor de saída. Caso o parâmetro de entrada seja um vetor, a função deve retornar um vetor de mesma dimensão, contendo o valor da função sigmoid de cada elemento.

A função custo deve receber como parâmetros a matriz de dados de entrada X, o vetor de valores alvo y (lembrando que a regressão logística é um algoritmo de treinamento supervisionado), o vetor de parâmetros θ e o parâmetro de regularização λ, e deve retornar o valor do custo para esse conjunto de parâmetros, e um vetor coluna contendo todas as derivadas parciais da função. Para facilitar, e agilizar, o cálculo da função custo, é obrigatório o uso de operações algébricas no lugarde loops de repetição, como o for. Por isso, a matriz X deve conter uma coluna adicional na primeira posição, formada somente pelo valor 1. O nome do arquivo deve ser o mesmo nome da função, acrescida da extensão .m.

Pode-se usar a função fminunc(), disponível no Matlab/Octave, para ser usada para estimar os valores ótimos de θ, ou também a função de gradiente descendente desenvolvida no último trabalho.

Os valores do vetor y variam de 1 a 10, contudo, o treinamento de uma regressão logística deve ter valores-alvo iguais a 0 ou 1. Assim, ao escolher qual caracter deverá ser reconhecido, deve-se criar um vetor-alvo de treinamento com os valores para esse caracter iguais a 1, e o restante dos valores iguais a zero. Consulte a documentação do Matlab ou do Octave sobre operadores relacionais, e como usá-los em matrizes e vetores. Não use laços de repetição para fazer essa atribuição.

### Entrega 
Os 3 (três) arquivos citados acima, devem ser compactados em um único arquivo .zip e enviados para o endereço de e-mail lucas.moreira@ifb.edu.br até às 23h55min do dia 21 de outubro de 2018.

O trabalho é individual, e deve ser entregue um arquivo compactado, contendo os 3 (três) scripts solicitados, por aluno(a). Cópias de trabalhos receberão nota 0 (zero). Em caso de dúvidas, pede-se que entrem em contato pelo endereço de e-mail acima.

### Ponto Extra
É possível construir um sistema de classificação de múltiplas classes, usando a estratégia one-vs all. O(a) aluno(a) que desenvolver tal sistema corretamente, ganhará um ponto extra, podendo atingir até 11 pontos nesse trabalho.