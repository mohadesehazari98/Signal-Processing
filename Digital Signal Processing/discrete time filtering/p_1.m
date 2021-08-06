[y,Fs] = audioread('NoisySound.wav');
%sound(y,Fs);

%Here we can hear a single tone noise 
%Fs                       % Sampling frequency
T = 1/Fs;                 % Sampling period
L = length(y);            % Length of signal
t =(0:L-1)*T;             % Time vector
f = Fs*(-1/2:1/(L-1):1/2);


Y = fft(y);
Y= fftshift(Y);
P = abs(Y/L);


%Now we need to design our filter
%We need a band-stop FIR filter
%plot(f,P)
%title('(FREQUENCY DOMAIN)The original signal without filter')
%xlabel('f (HZ)')
%ylabel('|Y|')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Now we want to filter our signal
%With Band-Pass Filter

y_noiseless = filter(BS,y);
%sound(y_noiseless,Fs);
audiowrite('NoiseLess.wav',y_noiseless,Fs);

%Fourier transform
Y_noiseless = fft(y_noiseless);
Y_noiseless= fftshift(Y_noiseless);
P_noiseless = abs(Y_noiseless/L);

%freqz(BS)
%title('Frequency response of the Band stop filter ')
%xlabel('f (Hz)')
%ylabel('BAND-STOP FILTER')
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Low-Pass Filter

y_noiseless_LP = filter(LP,y);
%sound(y_noiseless_LP,Fs);
audiowrite('NoiseLess_LP.wav',y_noiseless_LP,Fs);
%Here we can still hear the noise in our sound

%Fourier transform
Y_noiseless_LP = fft(y_noiseless_LP);
Y_noiseless_LP= fftshift(Y_noiseless_LP);
P_noiseless_LP = abs(Y_noiseless_LP/L);

%freqz(LP)
%title('Frequency response of the LOW PASS filter ')
%xlabel('f (Hz)')
%ylabel('LOW-PASS FILTER')
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%HIGH-Pass Filter

y_noiseless_HP = filter(HP,y);
%sound(y_noiseless_HP,Fs);
audiowrite('NoiseLess_HP.wav',y_noiseless_HP,Fs);

%Fourier transform
Y_noiseless_HP = fft(y_noiseless_HP);
Y_noiseless_HP= fftshift(Y_noiseless_HP);
P_noiseless_HP = abs(Y_noiseless_HP/L);

%freqz(HP)
%title('Frequency response of the HIGH PASS filter ')
%xlabel('f (Hz)')
%ylabel('HIGH-PASS FILTER')

%%
%Plotting signals
%TIME domain
subplot(4,1,1)
plot(t,y)
title('(TIME DOMAIN)The original signal without filter')
xlabel('t (time)')
ylabel('|y|')
subplot(4,1,2)
plot(t,y_noiseless)
title('(TIME DOMAIN)After filtering with Band-stop filter')
xlabel('t(time)')
ylabel('|y_noiseless|')
ylim([-0.7 0.7])
subplot(4,1,3)
plot(t,y_noiseless_LP)
title('(TIME DOMAIN)After filtering with Low Pass filter')
xlabel('t (time)')
ylabel('|y_noiseless_LP|')
ylim([-0.7 0.7])
subplot(4,1,4)
plot(t,y_noiseless_HP)
title('(TIME DOMAIN)After filtering with HIGH Pass filter')
xlabel('t (time)')
ylabel('|y_noiseless_HP|')
ylim([-0.7 0.7])
%%

%Plotting signals
%FREQUENCY domain
subplot(4,1,1)
plot(f,P)
title('(FREQUENCY DOMAIN)The original signal without filter')
xlabel('f (HZ)')
ylabel('|Y|')
subplot(4,1,2)
plot(f,P_noiseless)
title('(FREQUENCY DOMAIN)After filtering with Band-stop filter')
xlabel('f(HZ)')
ylabel('|Y_noiseless|')
subplot(4,1,3)
plot(f,P_noiseless_LP)
title('(FREQUENCY DOMAIN)After filtering with Low Pass filter')
xlabel('f (HZ)')
ylabel('|Y_noiseless_LP|')
subplot(4,1,4)
plot(f,P_noiseless_HP)
title('(FREQUENCY DOMAIN)After filtering with HIGH Pass filter')
xlabel('f (HZ)')
ylabel('|Y_noiseless_HP|')
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



