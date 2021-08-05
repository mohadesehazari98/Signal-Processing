function [ pairs ] = pairsfind( name )
[clip,fs] = audioread(name);
%clip = the decoded signal
% fs = the sampling rate
peaks = voiceprint(clip , fs);
pairs = peak_to_pair(peaks);
end