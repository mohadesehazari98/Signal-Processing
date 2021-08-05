ecg_data = load( 'ecg.dat');
Fs=500;
ecg_short_data = ecg_data(1 : 2001);
ecg_highpassed = (0.5 * Fs) * filter([1 0 -1], (1), ecg_short_data);
FT1(ecg_highpassed,Fs);
plot(ecg_highpassed)