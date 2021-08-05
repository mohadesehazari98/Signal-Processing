f0 = 10;
t1 = -1:(1/1000):1;
x1 =( f0 * ((sinc(f0*t1)).^2) )+( 15* sin(2*pi*f0*t1));
Fs1=20;
Fs2=50;
x2 = x1(1 : 1000/Fs1 : end);
x3 = x1(1 : 1000/Fs2 :end);
subplot(1,3,1)
plot(t1,x1)
title('single_sided Amplitude Spectrum of x(t),Fs=1000')
xlabel('Time(t)')
ylabel('x(t)')
grid on
subplot(1,3,2)
stem(x2)
title('single_sided Amplitude Spectrum of x(t),Fs1=20')
xlabel('Time(t)')
ylabel('x(t)')
grid on
subplot(1,3,3)
stem(x3)
title('single_sided Amplitude Spectrum of x(t),Fs2=50')
xlabel('Time(t)')
ylabel('x(t)')
grid on