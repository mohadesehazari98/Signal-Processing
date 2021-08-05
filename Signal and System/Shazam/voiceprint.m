function [peaks] = voiceprint(clip,fs)
%voiceprint is a function that will give clip(the decoded signal) and
%fs(sampling rate) and will do four procegures to get to the peaks matrix
clip = mean(clip , 2);
%combine two channel of clip by getting the mean of elements of each
%channel
clip = (clip) - (mean(clip));
%removing the dc of our signal
fs_new = 8000;
clip = resample(clip,fs_new,fs);
%here because our sampling rate was more than required we changed it
window = 512;
noverlap = 256;
% 
[S, F, T] = spectrogram(clip , window, noverlap, window , fs_new);

%figure(1)

%plot(S)
%xlabel('TIME')
%ylabel('FREQUENCY')

CSL = circshift(S,[0,-1]);
CSR = circshift(S,[0,1]);
CSU = circshift(S,[1,0]);
CSD = circshift(S,[-1,0]);
CSUR = circshift(S,[1,1]);
CSUL = circshift(S,[1,-1]);
CSDR = circshift(S,[-1,1]);
CSDL = circshift(S,[-1,-1]);
peaks = ((S-CSL) > 0) & ((S-CSR) > 0) & ((S-CSU) > 0) & ((S-CSD) > 0) & ((S-CSUR) > 0) &((S-CSUL) > 0) & ((S-CSDR) > 0) &  ((S-CSDL) > 0);
% peaks is the Constellation map
%figure(2)
%imagesc(peaks)
%colormap(1 - gray)
%
S_peaks = (S) .* (peaks) ;
%matrix that has just peaks
max_row_S = max(S_peaks);
max_S = max(max_row_S);
%finding the max of S matrix
count=0;
A = zeros(1 ,9488);
for i=1:257
    for j=1:343
if S_peaks(i,j) ~= 0
    count=count +1;
    A(count) = S_peaks(i,j);
end
    end
end
% 30 * T(end) = 330.9600
% So we need 331 peaks
A = sort(A , 'descend');
count=0;
for j=1:9488
    if count < 331 
        Limit = A(1,j);
        count = count+1;
    end
end
%finding the minimum peak
for i=1:257
    for j=1:343
        if S_peaks(i,j) < Limit
            S_peaks(i,j)=0;
        end
    end
end
%rewriting the S_peaks matrix with limited peaks
for i=1:257
    for j=1:343
        if S_peaks(i,j) ~= 0
            peaks(i,j)=1;
        else
            peaks(i,j)=0;
        end
    end
end
%rewriting peaks matrix
figure(2)
plot(S_peaks)
%colormap(1 - gray) 
end

