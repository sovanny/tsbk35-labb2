function [R, D, SNR] = dist_compress(y, fs, n_steps, blocksize)
    ymin = min(y);
    ymax = max(y);

    stepsize = (ymax-ymin)/n_steps;
    y_transformed = mdct(y, blocksize);

    y_quantized = quantize_equal_simple(y_transformed,stepsize);
    [~,~,idx] = unique(y_quantized);
    n = accumarray(idx(:),1);
    p = n/sum(sum(n));

    R = huffman(p);

    yhat = imdct(y_quantized*stepsize);
    diff = y - yhat;
    D = mean(diff.^2);
    SNR = 10*log10(var(y)/D);
end