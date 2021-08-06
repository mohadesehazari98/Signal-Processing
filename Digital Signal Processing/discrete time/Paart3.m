%__(A)__
[Music , fs] = audioread('music.mp3');
%__(B)__
samples=[1,length(Music)-(5*fs)];
[Music,fs] = audioread('music.mp3',samples);
Sound = zeros(length(Music),1);
for i=1:length(Sound)
    Sound(i,1)=(Music(i,1)+Music(i,2))/2;
end
%__(C)__
fs =fs/2;
M_D = downsample(Sound,2);
M_Dec = decimate(Sound,2);
%Loosely speaking, “decimation” is the process of reducing the sampling rate.
%In practice, this usually implies lowpass-filtering a signal,
%then throwing away some of its samples. 
%“Downsampling” is a more specific term which refers to just the process of throwing away samples,
%without the lowpass filtering operation.
y_1 = fft(M_D);
y_2 = fft(M_Dec);
z_1 = fftshift(y_1);
z_2 = fftshift(y_2);

ly_1 = length(y_1);
ly_2 = length(y_2);

f_1 = (-ly_1/2:ly_1/2-1)/ly_1*fs;
f_2 = (-ly_2/2:ly_2/2-1)/ly_2*fs;

%subplot(2,1,1)
%plot(f_1,abs(z_1))
%xlabel 'Frequency (Hz)'
%ylabel '|y_1|'
%subplot(2,1,2)
%plot(f_2,abs(z_2))
%xlabel 'Frequency (Hz)'
%ylabel '|y_2|'
%__(D)__

fs =fs * 2;
M_D = upsample(Sound,2);
M_Dec = interp(Sound,2);
%“Upsampling” is the process of inserting zero-valued samples between 
%original samples to increase the sampling rate. ... “Interpolation”,
%in the DSP sense, is the process of upsampling followed by filtering. 
%(The filtering removes the undesired spectral images.)
y_1 = fft(M_D);
y_2 = fft(M_Dec);
z_1 = fftshift(y_1);
z_2 = fftshift(y_2);

ly_1 = length(y_1);
ly_2 = length(y_2);

f_1 = (-ly_1/2:ly_1/2-1)/ly_1*fs;
f_2 = (-ly_2/2:ly_2/2-1)/ly_2*fs;

subplot(2,1,1)
plot(f_1,abs(z_1))
xlabel 'Frequency (Hz)'
ylabel '|y_1|'
subplot(2,1,2)
plot(f_2,abs(z_2))
xlabel 'Frequency (Hz)'
ylabel '|y_2|'

