clc;
clear;
close all;
addpath  D:\liu\Thesis\Matlab\low-latency-ffts-master\DSPToolbox
%%
K = [1,2,3,7];
N = [8,16,32,64,128];
%L = 2;
N_PE = 2; % 0 ~ no limitation
for j =2
    for i = 2
        schedule = FFT_ASAP_func(K(j),N(i),N_PE);
    end
end
% schedule = FFT_ASAP_func(2,64,N_PE);
 plotschedule(schedule)
