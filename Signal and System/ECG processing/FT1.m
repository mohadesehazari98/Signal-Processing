function [ X ] = FT1( Fs,x )
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here
f0=10;
x = x(1 : f0/Fs : end);
L=length(x);
NFFT=2^nextpow2(L);
X= fft(x,NFFT)/(16*L);
f= (Fs/2) * linspace(0,1,(NFFT/2)+1);
plot(f,2*abs(X(1:(NFFT/2)+1)))
title('single_sided Amplitude Spectrum of x(t)')
xlabel('Frequency(Hz)')
ylabel('|X(f)|')
grid on
end

