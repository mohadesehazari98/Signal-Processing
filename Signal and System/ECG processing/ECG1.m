ecg_data = load( 'ecg.dat');
ecg_short_data = ecg_data(1 : 2001);
t=linspace(1,5,2001);
Fs=500;
x=ecg_short_data;
figure
plot(t,x)
xlabel('Time(t)')
title('ecg_short_data')
L=length(x);
NFFT=2^nextpow2(L);
X= fft(x,NFFT)/(16*L);
f= (Fs/2) * linspace(0,1,(NFFT/2)+1);
figure
plot(f,2*abs(X(1:(NFFT/2)+1)))
title('single_sided Amplitude Spectrum of x(t)')
xlabel('Frequency(Hz)')
ylabel('|X(f)|')
grid on