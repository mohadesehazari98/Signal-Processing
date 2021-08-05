function Y = convolvefunction(x, h,nx, nh)
m=length(nx);
n=length(nh);
X=[x,zeros(1,m)];
H=[h,zeros(1,n)];
for i=1:n+m-1
    Y(i)=0;
    for j=1:m
        if(i-j+1>0)
            Y(i)=Y(i)+X(j)*H(i-j+1);
        else
        end
    end
end