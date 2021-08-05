ecg_data = load( 'ecg.dat');
ecg_short_data = ecg_data(1 : 2001);
plot(ecg_short_data)
title('ecg short data')
xlabel('Time(t)')
ylabel('x(t)')
grid on