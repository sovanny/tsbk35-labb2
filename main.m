[y_original, fs] = audioread("hey01.wav");

%% 1. Dela in signal i block och transformera
blocksize = 2^10;

y_transformed = mdct(y_original, blocksize);

%% 2. Kvantisera transformkomponenterna


%% 3. Använd någon form av kodning