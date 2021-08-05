function [ y ] = myconv( x,h,nx,nh )
%UNTITLED9 Summary of this function goes here
%  this is myconv function, this function will give us the convolution of
%  two function in a discrete area
ny = convindices(nx, nh);
y = conv(x,h);
stem(ny, y, 'lineWidth', 2)
xlabel('n');
ylabel('conv(x[n]*h[n])');
end

