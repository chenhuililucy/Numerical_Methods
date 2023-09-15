% Fitting with a Vandermonde matrix (Monomial basis)
% Takes in a series of points x
% A series of parameters stored in vector b

x = linspace(0.2, 1, 5);
degree = 12;
A = zeros(length(x), degree + 1);

for i = 1:length(x)
    A(i, :) = x(i).^(degree:-1:0);
end

len = length(x)
y = cos(4 * x); % function to be fitted
y = y(:);

b1 = lsqr(A, y);
Norm_r = norm(y - (A * b1))

x_new = linspace(0, 1, 200);
% Initialize vnew as an empty array
v_new = zeros(size(x_new));
for i = 1:length(x_new)
    v_new(i) = vander_f(x_new(i), b1);
end
plot(x, y, 'o')
hold on
plot(x_new, v_new, '*')


function fx = vander_f(x, b)
   n = length(b);
   fx = b(1);
   for i = 0:n-2
       fx = x * fx;
       fx = b(i + 1) + fx;
   end
end



