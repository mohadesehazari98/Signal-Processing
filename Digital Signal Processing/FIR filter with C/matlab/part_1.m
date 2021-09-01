%Part 2_5_4
%sound = wavread('mefsin.wav') ! wavread removed so I use audioread instead
[y,Sampling_Rate] = audioread('mefsin.wav');
sound(y,Sampling_Rate)
%Sampling Rate = 16000
L=length(y);
f = Sampling_Rate*(0:(L/2))/L;
Y =fft(y);
Y_2 = abs(Y/L);
Y_1 = Y_2(1:L/2+1);
Y_1(2:end-1) = 2*Y_1(2:end-1);

plot(f,Y_1) 
title('Single-Sided Amplitude Spectrum of mefsin(t)')
xlabel('f (Hz)')
ylabel('|Y_1(f)|')

%%
%Filtering
b=[1,-1.618033,1];
a=1;
Filtered_y =filter(b,a,y);
L=length(Filtered_y);
f = Sampling_Rate*(0:(L/2))/L;
Y =fft(Filtered_y);
Y_2 = abs(Y/L);
Y_1 = Y_2(1:L/2+1);
Y_1(2:end-1) = 2*Y_1(2:end-1);
sound(Filtered_y,Sampling_Rate)

plot(f,Y_1) 
title('Single-Sided Amplitude Spectrum of mefsin(t) After being filtered')
xlabel('f (Hz)')
ylabel('|Y_1(f)|')














