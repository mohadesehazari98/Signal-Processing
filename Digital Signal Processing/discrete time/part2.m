Ultra = load ('ultrasound.mat');
%Q__1__
Fsample = Ultra.data.fsample;
Signal = Ultra.data.signal ;
Time = Ultra.data.time ;
%Q__2__
%plot(Time,Signal)
%title('Signal')
%xlabel('Time(sec)')
%Q__3__
[Peaks_1 ,indices]  = findpeaks(Signal);
Peaks_2 = findpeaks(Peaks_1);
T_1 = indices( Peaks_1 == 1 );
T_2 = indices( Peaks_1 == 0.4 );
Delta_T = T_2 - T_1 ;
%We know that 2 * blood_vessel_diameter = velocity * Delta_T
velocity = 1540;
blood_vessel_diameter = (velocity * Delta_T)/2;
%Q__5__
Signal_With_Noise= awgn(Signal,25);
plot(Time,Signal )
hold on
plot(Time , Signal_With_Noise)
legend('Original Signal','Signal with AWGN')
xlabel('Time(sec)')
%Q__6__
[Peaks_1_n ,indices_n]  = findpeaks(Signal_With_Noise);
MAX = sort(Peaks_1_n);
L =length(MAX);
T_1_n = indices_n( Peaks_1_n == MAX(L) );
T_2_n = indices_n( Peaks_1_n == MAX(L-3) );
Delta_T_n = T_2_n - T_1_n ;

%We know that 2 * blood_vessel_diameter = velocity * Delta_T

blood_vessel_diameter_noise = (velocity * Delta_T_n)/2;



