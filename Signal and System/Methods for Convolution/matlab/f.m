function [ y ] = f( t )
%UNTITLED6 Summary of this function goes here
%  this is the f(t) function that is shown below
y = t.*(heaviside(t)- heaviside(t-2));
end

