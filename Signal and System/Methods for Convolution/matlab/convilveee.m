nx = 0 : 5;
x = ones(size(nx));
ny = convindices(nx, nx);
y = conv(x,x);
stem(ny, y, 'lineWidth', 2) 