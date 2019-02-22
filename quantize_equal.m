function y = quantize_equal(x,xmin,xmax,n_steps)
    step_size = (xmax-xmin)/n_steps;
    
    %normalize data to be between 0 and 1
    x_norm =(x-xmin)/(xmax-xmin);
    x_temp = floor(x_norm*n_steps);
    x_quantized = x_temp/n_steps;
    y = x_quantized*(xmax-xmin)+xmin;
    
end

