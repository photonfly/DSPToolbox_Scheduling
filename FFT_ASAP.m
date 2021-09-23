clc;
clear;
close all;
%addpath /home/xiata096/Thesis/low-latency-ffts/DSPToolbox;
addpath  D:\liu\Thesis\Matlab\low-latency-ffts-master\DSPToolbox
%% Generate the SFG 
K = 2;
N = 32;
N_PE = 2; % 0 ~ no limitation
sfg = FFT_gen(N);
%load('sfg128.mat');
%load('sfg256.mat');
timinginfo = getdefaulttiminginfo;
%printsfg(sfg);
%plotprecedence(sfg);
%% Parameters
schedule_time = K*N;
offset = 1000;
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
start_time_array = zeros(1,N_op); % To record every start time of the Operation
n = 0;
move_times = 0;
empty_slots = 0;
butterfly_ids = zeros(1,N_op);
while(move_times ~= N_op)
% Which btf to be moved? How many clks that it can be moved?
    tic
    [anySpace, btf_id_move,min_value] = isAnySpace(schedule,butterflyids+1); 
% What is the distance to be moved? 
    [distance,start_time_aftermove_0] = distance_to_move(schedule, btf_id_move, min_value,start_time_array,N_PE);
    move_times = move_times + 1; % Used to count move times
    start_time_array(move_times) = start_time_aftermove_0;
    schedule = changestarttime(schedule, 'butterfly2', btf_id_move, distance);
    butterfly_ids(move_times) = btf_id_move;
    toc
    fprintf('Current Op is %d, while total Op is %d \n',move_times,N_op);
end
%% Move the ouputs as soon as possible
[anySpace, btf_id_move,min_value] = isAnySpace(schedule,outputid+1);
while(anySpace)
    out_time = getstarttimes(schedule,'out',btf_id_move) + min_value;
    schedule = changestarttime(schedule, 'out', btf_id_move, min_value);
    [anySpace, btf_id_move,min_value] = isAnySpace(schedule,outputid+1);
end
schedule = changeendTime(schedule,out_time); % Change end time
disp(schedule(1,1));
%printstarttimes(schedule);
% plotschedule(schedule);

%% Latencies
% % Get the start time of last input 
% Start_time_lastIn = getstarttimes(schedule,'in',N - 1);
% % Get the start time of First output No. N_op - N 
% Start_time_FirstOut = getstarttimes(schedule,'butterfly2',butterfly_ids(N_op - N));
% % Calculate the latency
% Latency = Start_time_FirstOut - Start_time_lastIn + 2


