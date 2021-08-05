nx=-20:20;
x = heaviside(nx) - heaviside(nx - 2);
nh=-20:20;
h = (sinc(2*pi.*nh)).*( heaviside(nh+4) - heaviside(nh-5));
subplot(2,1,1)
tic
s = convolvefunction(x,h,nx,nh);
toc
t1=toc;
title('myconv')
ny = convindices(nx, nh);
tic
y = conv(x,h);
toc
t2=toc;
subplot(2,1,2)
stem(ny, y, 'lineWidth', 2)
title('matlab conv')
xlabel('n');
ylabel('conv(x[n]*h[n])');
%%plot(t1);