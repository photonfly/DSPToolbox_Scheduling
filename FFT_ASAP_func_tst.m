clc;
clear;
close all;
addpath  D:\liu\Thesis\Matlab\low-latency-ffts-master\DSPToolbox
%%
K = [1,2,3,7];
N = [8,16,32,64,128];
%L = 2;
N_PE = 1; % 0 ~ no limitation
for j =1
    for i = 1:5
        schedule = FFT_ASAP_func(K(j),N(i),N_PE);
    end
end
% schedule = FFT_ASAP_func(2,64,N_PE);
 plotschedule(schedule)
