[clip,fs] = audioread('viva.mp3');
%clip = the decoded signal
% fs = the sampling rate
peaks = voiceprint(clip , fs);
pairs = peak_to_pair(peaks);
