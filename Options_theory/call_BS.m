% Option parameters
sigma = 0.12; % Flat volatility
strike = 105.0; % Fixed strike
epsilon = 0.4; % The % on the left/right of Strike.

% Asset prices are centered around Spot ("ATM Spot")
shortexpiry = 30; % Shortest expiry in days
longexpiry = 720; % Longest expiry in days
riskfree = 0.00; % Continuous risk-free rate
divrate = 0.00; % Continuous div rate

% Grid definition
dx = 40;
dy = 40;

% Steps throughout asset price and expiries axis
% xx: Asset price axis, yy: expiry axis, zz: greek axis
[xx, yy] = meshgrid(linspace(strike * (1 - epsilon), (1 + epsilon) * strike, dx), ...
    linspace(shortexpiry, longexpiry, dy));

fprintf('Calculating greeks...\n');

zz = arrayfun(@(x, y) BSMerton([1, x, strike, riskfree, divrate, y, sigma]).delta(), xx, yy);

% Plot greek surface
fprintf('Plotting surface...\n');

fig = figure();
set(fig, 'Name', 'Call Delta', 'NumberTitle', 'off');
surf(xx, yy, zz, 'EdgeColor', 'none', 'FaceColor', 'interp');
title('Call Delta', 'FontSize', 20);
xlabel('Asset price');
ylabel('Expiry');
zlabel('Delta');

% Plot 3D contour
zzlevels = linspace(min(zz(:)), max(zz(:)), 8);
xxlevels = linspace(min(xx(:)), max(xx(:)), 8);
yylevels = linspace(min(yy(:)), max(yy(:)), 8);