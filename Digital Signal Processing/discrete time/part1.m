%Part__1__A__
n1=0;
n2=10;
M=800;
k = (-M:M);
Omega= (pi/M) * k;
n = (n1:n2);
%Defining our function 
x = (0.9 * exp(1i*pi/3)).^ n ; 
%Fourier Transform
X = x *  (exp(-1i*pi/M)) .^(n' *k);
%Plotting
subplot(2,1,1)
plot(Omega/pi,abs(X));
xlim([-1 1])
title('A')
xlabel('Omega per pi')
ylabel('Magnitude of X')
subplot(2,1,2)
plot(Omega/pi,angle(X));
xlim([-1 1])
title('A')
xlabel('Omega per pi')
ylabel('The Angle of X')
%%
%Part__1__B__
n1=-10;
n2=10;
M=800;
k = (-M:M);
Omega= (pi/M) * k;
n = (n1:n2);
%Defining our function 
x = (0.9 ).^ n ; 
%Fourier Transform
X = x *  (exp(-1i*pi/M)) .^(n' *k);
%Plotting
subplot(2,1,1)
plot(Omega/pi,abs(X));
xlim([-1 1])
title('B')
xlabel('Omega per pi')
ylabel('Magnitude of X')
subplot(2,1,2)
plot(Omega/pi,angle(X));
xlim([-1 1])
title('B')
xlabel('Omega per pi')
ylabel('The Angle of X')
