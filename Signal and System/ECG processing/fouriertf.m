x =( f0 * ((sinc(f0*t)).^2) )+( 15* sin(2*pi*f0*t));
subplot(1,3,1)
X1=FT1( 32000,x,16000 );
subplot(1,3,2)
X2=FT1(64000,x,16000);
subplot(1,3,3)
X3=FT1(1000,x,10);