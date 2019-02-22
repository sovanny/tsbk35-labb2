function y = quantize_equal(x,n_steps,xmin,xmax)
    if nargin < 2
        error("Not enough input arguments")
    elseif nargin == 2
        xmin  = min(min(x));
        xmax  = max(max(x));
    elseif nargin == 4

    else
        error("wrong number of input arguments")    
    end

    step_size = (xmax-xmin)/n_steps;
    
    %normalize data to be between 0 and 1
    x_norm =(x-xmin)/(xmax-xmin);
    x_temp = floor(x_norm*n_steps);
    x_quantized = x_temp/n_steps;
    y = x_quantized*(xmax-xmin)+xmin;
    
end

