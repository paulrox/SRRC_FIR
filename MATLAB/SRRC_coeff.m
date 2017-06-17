% SRRC filter coefficients quantization. The coefficients are represented
% as signed integers on 16 bits where 14 bits have been used to represent
% the fractional part.

clearvars; close all; clc;

n = 23;     % number of coefficients
%% Define the vector of the coefficients

C_half = [-0.0165 -0.0150 0.0155 0.0424 0.0155 -0.0750 -0.1568 -0.1061 ...
    0.1568 0.5786 0.9745 1.1366];

[~, C_half_size] = size(C_half);

C = [C_half wrev(C_half(1:C_half_size-1))];

%% Convert the coefficients to integer numbers

C_int = floor(C/2^(-14));

%% Write the obtained coefficients to a text file

x = zeros(1,n);
fileID = fopen('SRRC_coeff.txt', 'w');

for k=1 : n
    fprintf(fileID, '%d\n', C_int(k));
    x(1,k) = 4080;
end;