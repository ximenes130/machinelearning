function plotData(K, X, indexes)
%plotData - Plota os dados
%
% Syntax: plotData()
  
  plot(K(:,1), K(:,2), 'xr;Centroides;', 'markersize', 10, 'linewidth', 3);
  xlabel('millage');
  ylabel('carbon');
  hold on;
  for k = 1:size(K, 1)
    plotX = [];
    plotY = [];
    for i = 1:size(indexes, 1)
      if (indexes(i) == k)
        plotX = horzcat(plotX, X(i, 1));
        plotY = horzcat(plotY, X(i, 2));
      end
    end
    plot(plotX, plotY, strcat ('.;Emissao de carbono classe ', num2str(k), ';'),'markersize', 15);
  end
  hold off;
  % Pausando iteração para dar tempo de plotar o grafico
  pause(0.1);
end