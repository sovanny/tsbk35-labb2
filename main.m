clear all; close all; clc
filename = 'hey12';
[y, fs] = audioread(strcat(filename,'.wav'));

%% 1. Dela in signal i block och transformera
blocksize = 2^8;
n_steps = 24;
ymin = min(y);
ymax = max(y);

stepsize = (ymax-ymin)/n_steps;
y_transformed = mdct(y, blocksize);

%% 2. Kvantisera transformkomponenterna och räkna ut p

y_quantized = quantize_equal_simple(y_transformed,stepsize);
[symbols,~,idx] = unique(y_quantized);
n = accumarray(idx(:),1);
p = n/sum(sum(n));

%plot(p)

%% 3. Anv?nd n?gon form av kodning
R = huffman(p);


%% Nytt block för det
yhat = imdct(y_quantized*stepsize);
diff = y - yhat;
D = mean(diff.^2);
SNR = 10*log10(var(y)/D);

fprintf('=== Results ===\n')
fprintf('block size:  %i\n', blocksize)
fprintf('step size:   %f\n', stepsize)
fprintf('nr of steps: %i\n', n_steps)
fprintf('R:           %f\n', R)
fprintf('D:           %f\n', D)
fprintf('SNR:         %f\n', SNR)

%%
new_filename = strcat(filename,'_dist.wav');
audiowrite(new_filename,yhat,fs);
