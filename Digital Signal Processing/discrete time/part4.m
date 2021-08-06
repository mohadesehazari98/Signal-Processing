%__PART 1__
R=0.5;
W0=pi/2;
zplane([1 0 0],[1 -2*R*cos(W0) R*R]);
W0=pi/4;
zplane([1 0 0],[1 -2*R*cos(W0) R*R]);
%__PART 2__
[H,w]=freqz([1 0 0],[1 -2*R*cos(W0) R*R],100);
subplot(2,1,1)
plot(w,abs(H));
title('DTFT of h[n]')  
ylabel('|H(exp(jw)|')
subplot(2,1,2)
plot(w,phase(H));
title('DTFT of h[n]')  
ylabel('phase')
%__PART 3__
W0=pi/4;
[H_n,w]=freqz([1 0 0],[1 -2*R*cos(W0) R*R],100);
%here we wanna make the inverse fourier transform
h=ifft(H_n);
%subplot(2,1,1)
%plot(abs(h));
%title('h[n]')  
%ylabel('abs|h[n]|')
%subplot(2,1,2)
%plot(phase(h));
%title('h[n]')  
%ylabel('phase(h[n])')