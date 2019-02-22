function y = quantize_equal_simple(x,stepsize)
    y = x/stepsize;   
    y = round(y);
end