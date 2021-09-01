%This part is sine wave without noise
%Filter
fileID = fopen('coefficient.txt','w');
fprintf(fileID,'%d\n',Num);
%%
%generating random frequencies
Sampling_Rate = 24000;
t=(0:9999)*(1/Sampling_Rate);
out = 0.1* sine(1500,t)+ 0.1 *randn(1,10000);
%Fourier Transform
L=length(out);
f = Sampling_Rate*(0:(L/2))/L;
Y =fft(out);
Y_2 = abs(Y/L);
Y_1 = Y_2(1:L/2+1);
Y_1(2:end-1) = 2*Y_1(2:end-1);

plot(f,Y_1) 
title('Single-Sided Amplitude Spectrum of sine(t)')
xlabel('f (Hz)')
ylabel('|Y_1(f)|')

fileID = fopen('sine_1.txt','wt');
fprintf(fileID,'%d\n',out);

%%
%fileID = fopen('sine_1_out.txt','r');
%out = fscanf(fileID,'%d');
out = importdata('sine_1_out.txt');
Sampling_Rate=24000;
%Fourier Transform
L=length(out);
f = Sampling_Rate*(0:(L/2))/L;
Y =fft(out);
Y_2 = abs(Y/L);
Y_1 = Y_2(1:L/2+1);
Y_1(2:end-1) = 2*Y_1(2:end-1);

plot(f,Y_1) 
title('Single-Sided Amplitude Spectrum of sine(t) after being filtered')
xlabel('f (Hz)')
ylabel('|Y_1(f)|')









