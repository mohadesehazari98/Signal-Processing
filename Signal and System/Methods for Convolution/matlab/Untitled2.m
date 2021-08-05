t = -10:0.01:10;
n = length(t);
y = heaviside(t);
oldparam = sympref('HeavisideAtOrigin',1);
f = t.*(heaviside(t)- heaviside(t-2));
plot(t,f)
axis([-10 10 -2 2])