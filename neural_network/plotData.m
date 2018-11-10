function plotData(X, y)
%PLOTDATA Plots the data points X and y into a new figure 
%   PLOTDATA(x,y) plots the data points with + for the positive examples
%   and o for the negative examples. X is assumed to be a Mx2 matrix.

% Create New Figure
figure; hold on;

ind = y==1;
plot(X(ind,1),X(ind,2),'b+');
plot(X(~ind,1),X(~ind,2),'ro');

hold off;

end
