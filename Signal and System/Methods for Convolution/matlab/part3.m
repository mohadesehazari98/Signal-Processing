t = -10:0.01:10;
f1=f(t);
f2=f(t+1);
f3=f(-t+1);
f4=f(-2*t+1);
subplot(2,2,1)
plot(t,f1)
title('f(t)')
subplot(2,2,2)
plot(t,f2)
title('f(t+1)')
subplot(2,2,3)
plot(t,f3)
title('f(-t+1)')
subplot(2,2,4)
plot(t,f4)
title('f(-2t+1)')
axis([-10 10 -2 2])