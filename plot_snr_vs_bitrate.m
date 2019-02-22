clear all; clc
n_steps = 35;
x=1:n_steps;
block_sizes = [256 512 1024];
snr_1 = zeros(n_steps,1);
snr_2 = zeros(n_steps,1);
snr_3 = zeros(n_steps,1);
r1 = zeros(n_steps,1);
r2 = zeros(n_steps,1);
r3 = zeros(n_steps,1);

[y, fs] = audioread(strcat('heyhey.wav'));

fprintf('=== LOOP ===\n')
for i = 1:n_steps
    tic
    fprintf('STEP NR: %i\n',i)
    
    fprintf('\tcalculating blocksize %i...',block_sizes(1))
    [r1(i),~,snr_1(i)] = transform_encoding(y,i, block_sizes(1));
    fprintf('\tdone\n')
    
    fprintf('\tcalculating blocksize %i...',block_sizes(2))
    [r2(i),~,snr_2(i)] = transform_encoding(y,i, block_sizes(2));
    fprintf('\tdone\n')
    
    fprintf('\tcalculating blocksize %i...',block_sizes(3))
    [r3(i),~,snr_3(i)] = transform_encoding(y,i, block_sizes(3));
    fprintf('\tdone\n')
    toc
end

%% Plot
close all;
figure
hold on
legend on
xlabel('R')
ylabel('SNR')
plot(r1,snr_1)
plot(r2,snr_2)
plot(r3,snr_3)

L1 = ['blocksize ',num2str(block_sizes(1))];
L2 = ['blocksize ',num2str(block_sizes(2))];
L3 = ['blocksize ',num2str(block_sizes(3))];
legend(L1,L2,L3)
