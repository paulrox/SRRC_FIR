function [ y ] = twos2dec( x, n )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

if x(1) == '1'
    y = -(2^n - bin2dec(x));
else
    y = bin2dec(x);
end;

end

