nx = 0 : 24;
x = ((0.5).^(nx - 2)).*(heaviside(nx - 2 ));
nh = 0:14;
h = heaviside(nh);
ny = convindices(nx, nh);
y = conv(x,h);
stem(ny, y, 'lineWidth', 2)
xlabel('n');
ylabel('conv(x[n]*h[n])');