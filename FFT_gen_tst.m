close all;
clear;
clc;
addpath  D:\liu\Thesis\Matlab\low-latency-ffts-master\DSPToolbox
N= 16 ;
% K_array = [1,2,4,8];
K = 2;
timinginfo = getdefaulttiminginfo;
%Pipeline 1
timinginfo.butterfly2.latency = 2;
timinginfo.butterfly2.executiontime = 1;
sfg = FFT_gen(N);
% for i = 1:4
%     K = K_array(i);
%     init_schedule = getinitialschedule(sfg , timinginfo, 0, 0:K:(K*(N-1)));
%     plotschedule(init_schedule);
% end
init_schedule = getinitialschedule(sfg , timinginfo, 0, 0:K:(K*(N-1)));
plotschedule(init_schedule);
disp(init_schedule(1,1))
schedule_time_eq = K*(N-1)+log2(N)