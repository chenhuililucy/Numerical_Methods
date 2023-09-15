
function T = chebyshev(n)
    % Compute the nth Chebyshev polynomial using a recursive approach
    % Inputs:
    %   n: The degree of the Chebyshev polynomial to compute
    % Output:
    %   T: The nth Chebyshev polynomial as a symbolic expression
    
    syms x; % Declare 'x' as a symbolic variable
    
    if n == 0
        T = 1; % T0(x) = 1
    elseif n == 1
        T = x; % T1(x) = x
    else
        % Recursive formula for Chebyshev polynomials:
        T = 2 * chebyshev(n - 1) - chebyshev(n - 2);
        % Tn(x) = 2*Tn-1(x) - Tn-2(x) for n >= 2
    end
end