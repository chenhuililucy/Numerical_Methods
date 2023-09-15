N = 1000;  % Number of data points

% Generate random points within [0, 1]
xp = rand(1, N);  % x-coordinates
yp = rand(1, N);  % y-coordinates

% Create a grid of points for plotting
x1 = linspace(0, 1, 100);  % Generate 100 evenly spaced x-values
y1 = linspace(0, 1, 100);  % Generate 100 evenly spaced y-values
[x, y] = meshgrid(x1, y1);  % Create a grid of (x, y) points

% Generate noisy z-coordinates for the data points
zp = f(xp, yp) + randn(1, N) * 0.05;
% randn(1, N) generates random numbers from a Gaussian distribution (mean 0, standard deviation 1),
% and we add a small amount of noise to the values.

% Create a 3D scatter plot of the data points
scatter3(xp, yp, zp);
xlabel('xp');
ylabel('yp');
zlabel('zp');
title('Scatter Plot of zp as a Function of xp and yp');

% Define the function f(x, y)
function z = f(x, y)
    % This function computes z as a function of x and y
    z = sin(((1 - x).^2 + (1 - y).^2).^0.5 * pi * 2);
end
