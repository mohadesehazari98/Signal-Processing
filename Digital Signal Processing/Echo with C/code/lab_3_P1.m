%%
Fs=16000;%Sampling frequency in hertz
ch=1;
datatype='uint8';
nbits=16;
Nseconds=5;
% to record audio data from an input device ...
...such as a microphone for processing in MATLAB
recorder=audiorecorder(Fs,nbits,ch);
disp('Start speaking..')
%Record audio to audiorecorder object,...
...hold control until recording completes
recordblocking(recorder,Nseconds);
disp('End of Recording.');
%Store recorded audio signal in numeric array
x=getaudiodata(recorder,datatype);
%Write audio file
audiowrite('test.wav',x,Fs);
%%
s = tf('s');
H = (1 + 0.5 * s^-1000) / (1 - 0.5 * s^-1000);
[x,Fs] = audioread('test.wav');
hz = tf(H.Numerator, H.Denominator, Fs);
[y,t]=lsim(hz,x);
audiowrite('echo.wav',y,Fs)







