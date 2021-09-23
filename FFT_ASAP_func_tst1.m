clc;
clear;
close all;
addpath  D:\liu\Thesis\Matlab\low-latency-ffts-master\DSPToolbox
%%
K = 1;
N_PE = 1; % 0 ~ no limitation
N = [4,8,16,32,64,128];
%L = 2;
for i = 1:6
schedule = FFT_ASAP_func(K,N(i),N_PE);

end
plotschedule(schedule);