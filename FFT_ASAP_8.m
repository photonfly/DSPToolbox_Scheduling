clc;
clear;
close all;
addpath /home/xiata096/Thesis/low-latency-ffts/DSPToolbox;
%% Generate the SFG 
K = 2;
N = 8;
sfg = FFT_gen(N);
timinginfo = getdefaulttiminginfo;
%printsfg(sfg);
%plotprecedence(sfg);
%% Parameters
schedule_time = K*N;
offset = 100;
delay_of_buttefly = 1;
% Get a initial schedule
schedule = getinitialschedule(sfg, timinginfo,schedule_time + offset);
printstarttimes(schedule);
detination_time = schedule_time;

inputids = 0 : N - 1;
butterflyids = N : N + (N/2)*log2(N) - 1;
N_op = (N/2)*log2(N);
outputid = N + (N/2)*log2(N) : N + (N/2)*log2(N) + N - 1;
%% To move the output nodes
% Get the start time
start_time = schedule(end,10);
% Get the detination time

% Calculate the difference
Diff_time_output = detination_time - start_time; 
for out_id = outputid
    schedule = changestarttime(schedule, 'out', out_id, Diff_time_output+offset);
end

%% To move output butterflies
% Destination time
output_butterfly_dt = schedule_time - delay_of_buttefly;
% Start time 
output_butterfly_st =  schedule(end - N,10);
% Diff
Diff_time_otbtf = output_butterfly_dt - output_butterfly_st;
printstarttimes(schedule);
for op_id = butterflyids
    schedule = changestarttime(schedule, 'butterfly2', op_id, Diff_time_otbtf+offset);
end
%% Input in a rate of K
for i = inputids
    schedule = changestarttime(schedule, 'in', i ,i*K);
end
printstarttimes(schedule);
%% Move the operand as soon as possible
[anySpace, btf_id_move,min_value] = isAnySpace(schedule,butterflyids+1);
start_time_aftermove_0 = schedule(btf_id_move,10) + min_value;
n = 0;
move_times = 0;
while(move_times ~= N_op)
    schedule = changestarttime(schedule, 'butterfly2', btf_id_move, min_value);
    close all;
    plotschedule(schedule);
    move_times = move_times + 1; 
    [anySpace, btf_id_move,min_value] = isAnySpace(schedule,butterflyids+1); 
   % printstarttimes(schedule);
    start_time_aftermove = getstarttimes(schedule,'butterfly2',btf_id_move) + min_value;
    if(start_time_aftermove == start_time_aftermove_0)
        min_value = min_value + 1;
        start_time_aftermove_0 = start_time_aftermove + 1;
    else
        start_time_aftermove_0 = start_time_aftermove;
    end
end
%% Move the ouputs as soon as possible
% [anySpace, btf_id_move,min_value] = isAnySpace(schedule,outputid+1);
% while(anySpace)
%     schedule = changestarttime(schedule, 'out', btf_id_move, min_value);
%     [anySpace, btf_id_move,min_value] = isAnySpace(schedule,outputid+1);
% end
plotschedule(schedule);
