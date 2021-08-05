n = 0:1:99;
x = cos(n .^ 2) .* sin(((2*pi) .* n)/5);
h = ((0.9) .^ n ) .* (heaviside(n) - heaviside(n-10)); 
y = conv(x,h);
stem( y) 