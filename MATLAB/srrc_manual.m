function [y,z] = srrc_manual(xn,z, reset)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    b = [-271, -246, 253, 694, 253, -1229, -2570, -1739, 2569, 9479, ...
        15966, 18622, 15966, 9479, 2569, -1739, -2570, -1229, 253, 694,...
        253, -246, -271];
    if reset == 1
        z = zeros(size(z));
    else
        y = 0;
        for n=1:length(z)
            z = [xn; z(1:end-1)];
            y = y + b(n) * z(n);
        end;
    end;

end