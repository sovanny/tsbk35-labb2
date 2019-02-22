clear all; close all; clc
filename = 'heyhey';
[y, fs] = audioread(strcat(filename,'.wav'));

blocksize = 512;
n_steps = 24;
ymin = min(y);
ymax = max(y);

stepsize = (ymax-ymin)/n_steps;
[R,D,SNR] = transform_encoding(y, n_steps, blocksize);

fprintf('block size:    %i\n', blocksize)
fprintf('step size:     %f\n', stepsize)
fprintf('nr of steps:   %i\n', n_steps)
fprintf('R:             %f\n', R)
fprintf('D:             %e\n', D)
fprintf('SNR:           %f\n', SNR)

