clear all; close all; clc
[y_original, fs] = audioread("hey01.wav");

%% 1. Dela in signal i block och transformera
blocksize = 2^10;
n_steps = 30;
y_transformed = mdct(y_original, blocksize);

%% 2. Kvantisera transformkomponenterna
y_quantized = quantize_equal(y_transformed,n_steps);

%% calculate p and alphabet
[symbols,~,idx] = unique(y_quantized);
n = accumarray(idx(:),1);
p = n/sum(sum(n));

%plot(p)
%% 3. Anv?nd n?gon form av kodning
dict = huffmandict(symbols,p);
y_flt = reshape(y_quantized,1,numel(y_quantized));
huff = huffmanenco(y_flt,dict);
%y_huff = reshape(huff,size(y_quantized));


