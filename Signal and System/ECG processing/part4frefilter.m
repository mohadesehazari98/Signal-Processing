ecg_data = load( 'ecg.dat');
fs=500;
ecg_short_data = ecg_data(1 : 2001); 
ecg_highpassed = (0.5 * fs) * filter([1 0 -1], (1), ecg_short_data);
fc = 70;
wn = fc/(fs/2); % Ans:one side of the sampling frequency
n = 8;
[b, a] = butter(n, wn, 'low');
ecg_lowpassed = filter(b, a, ecg_highpassed);
fpl = 50;
b = [1 -2*cos(2*pi*fpl/fs) 1];
a = 1; 
ecg_notched = filter(b, a, ecg_lowpassed);
[cor, lag] = xcorr(ecg_notched);
figure
plot(lag, cor)
title( 'Auto Correlation Function of Filtered ECG')
xlabel( 'Delay (ms) ')
