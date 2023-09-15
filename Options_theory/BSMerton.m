classdef BSMerton
    properties
        Type    % 1 for a Call, -1 for a put
        S       % Underlying asset price
        K       % Option strike K
        r       % Continuous risk-free rate
        q       % Dividend continuous rate
        T       % Compute time to expiry
        sigma   % Underlying volatility
        sigmaT  % sigma*T for reusability
        d1      % d1 value
        d2      % d2 value
        Delta   % Delta value
    end
    
    methods
        function obj = BSMerton(args)
            obj.Type = args(1); % 1 for a Call, -1 for a put 
            obj.S = args(2); % Underlying asset price
            obj.K = args(3); % Option strike K
            obj.r = args(4); % Continuous risk-free rate
            obj.q = args(5); % Dividend continuous rate
            obj.T = args(6) / 365.0; % Time to expiry
            obj.sigma = args(7); % Implied Volatility
            obj.sigmaT = obj.sigma * sqrt(obj.T);
            obj.d1 = (log(obj.S / obj.K) + (obj.r - obj.q + 0.5 * (obj.sigma^2)) * obj.T) / obj.sigmaT;
            obj.d2 = obj.d1 - obj.sigmaT;
            obj.Delta = obj.calc_delta();
        end
        
        % delta calculation
        function result = calc_delta(obj)
            dfq = exp(-obj.q * obj.T);
            if obj.Type == 1
                result = dfq * normcdf(obj.d1);
            else
                result = dfq * (normcdf(obj.d1) - 1);
            end
        end

        % delta calculation
        function result = calc_


    end
end