% Generate the bounduary testing vector and a random vector of input data
clearvars; clc; close all;

% Bounduary test vector
bt_tv = [-32768 -32767 0 32766 32767];
% Random test vector
rand_tv = randi([-32768 32767], 20, 1);
