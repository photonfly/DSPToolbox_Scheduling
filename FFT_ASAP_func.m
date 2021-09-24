function schedule = FFT_ASAP_func(K,N,N_PE)
%% Generate the SFG
% K = 2;
% N = 16;
% %L = 2;
% N_PE = 4; % 0 ~ no limitation
sfg = FFT_gen(N);
%[butterfly_mat,butterfly_array] = FFT_mat(N);
timinginfo = getdefaulttiminginfo;
timinginfo.butterfly2.latency = 1;
timinginfo.butterfly2.executiontime = 1;

%% Parameters
%delay_of_buttefly = 1;
% Get a initial ASAP schedule
schedule = getinitialschedule(sfg , timinginfo, 10000, 0:K:(K*(N-1)));
%plotschedule(init_schedule);
%inputids = 0 : N - 1;
N_op = (N/2)*log2(N);
butterflyid = 1:N_op;
outputid = N : 2*N - 1;
%printstarttimes(schedule);
%% Move outputs
for out_id = outputid
    schedule = changestarttime(schedule, 'out', out_id, 5000);
end
%% move back butterflies, to make enough space to move
if (N_PE == 1)||(N == 4)
    layers_stay = 1;
else
    layers_stay = 2;
end
for op_id = butterflyid(end) :-1: butterflyid(1+layers_stay*N/2)
    schedule = changestarttime(schedule, 'butterfly2', op_id, 5000);
end
% plotschedule(schedule);
%% move forward butterflies
ids_first_layers = N + 1 : N + layers_stay*(N/2);
start_time_array =  zeros(1,N_op);
start_time_array(1:layers_stay*(N/2)) = schedule(ids_first_layers+1,end - 2);
move_times = layers_stay*(N/2) ;
%butterfly_ids stores the ids of butterfly in the sfg
butterfly_ids = zeros(1,N_op);
% butterflyids is tthe row index of butterfly schedule in the schedule
% matrix
% it starts from N + N/2 (inputs + first layer btf
%ends at the last btf index: N + N_op
%printstarttimes(schedule);
butterflyids = N + layers_stay*N/2 + 1:N_op;
move_sequence = btf_sequence_gen(schedule,butterflyids);
%for btf_id_move = butterflyids
%T = zeros(1,length(butterflyids));
% What is the distance to be moved?
% for i = 1 : length(butterflyids)
for i = 1 : length(butterflyids)
    btf_id_move = move_sequence(i,1);
    min_value = getlowerbound(schedule, move_sequence(i,3));
    [distance,start_time_aftermove_0] = distance_to_move(schedule, btf_id_move, min_value,start_time_array,N_PE);
    move_times = move_times + 1; % Used to count move times
    start_time_array(move_times) = start_time_aftermove_0;
    schedule = changestarttime(schedule, 'butterfly2', btf_id_move, distance);
    butterfly_ids(move_times) = btf_id_move;
    %toc
    %fprintf('Current Op is %d, start_time_aftermove is %d \n',btf_id_move,start_time_aftermove_0);
    %plotschedule(schedule);
end
% plotschedule(schedule);
% plotprecedence(sfg);
%% second last and last layer
btf_ids = second_last_trans(N);
last_btf_ids = N_op :-1: N_op - N/2 + 1;
target_time = max(start_time_array)+1;
schedule = moveoperand(schedule, btf_ids(1),target_time);
target_time = target_time + 1;
for i = 2:N/2
    schedule = moveoperand(schedule, btf_ids(i),target_time);
    target_time = target_time + 1;
    schedule = moveoperand(schedule, last_btf_ids(i-1),target_time);
    target_time = target_time + 1;
end
target_time = target_time + 1;
schedule = moveoperand(schedule, last_btf_ids(i),target_time);
%% last layer
% while(move_times ~= N_op - N/2)
%     %tic
%     tic
%     [~, btf_id_move,min_value] = isAnySpace(schedule,butterflyids);
%     toc
% % What is the distance to be moved?
%     [distance,start_time_aftermove_0] = distance_to_move(schedule, btf_id_move, min_value,start_time_array,N_PE);
%     move_times = move_times + 1; % Used to count move times
%     start_time_array(move_times) = start_time_aftermove_0;
%     schedule = changestarttime(schedule, 'butterfly2', btf_id_move, distance);
%     butterfly_ids(move_times) = btf_id_move;
%     %toc
%     fprintf('Current Op is %d, start_time_aftermove is %d \n',btf_id_move,start_time_aftermove_0);
%     %plotschedule(schedule);
% end
%plotschedule(schedule);
%% move forward outputs
%output index in schedule
% output_index = N + N_op + 1 : 2*N + N_op;
% [anySpace, btf_id_move,min_value] = isAnySpace(schedule,output_index);
% while(anySpace)
%     out_time = getstarttimes(schedule,'out',btf_id_move) + min_value;
%     schedule = changestarttime(schedule, 'out', btf_id_move, min_value);
%     [anySpace, btf_id_move,min_value] = isAnySpace(schedule,output_index);
% end
% schedule = changeendTime(schedule,out_time); % Change end time
%plotschedule(schedule);
%tEnd = toc(tStart) ;
%% output L = 1
target_time = getstarttimes(schedule,'butterfly2',last_btf_ids(1)) + 1;
output_index = N : 2*N-1;
for i = 1:N
    schedule = moveoutputs(schedule, output_index(i),target_time);
    target_time = target_time + 1;
end
schedule = changeendTime(schedule,target_time-1); % Change end time

%% For debugging
% init_schedule_time = K*(N-1)+log2(N);
% extra_cc = schedule(1,1) - init_schedule_time;
% ops = sum(start_time_array>=K*N);
% 
% %ops = sum(start_time_array>=init_schedule_time);
% extra_op = extra_op_func(N,K,N_PE);
% % fprintf("The extra_cc = %d \n",extra_cc);
% % fprintf("Expression,the extra_op is %d\n",extra_op);
% fprintf("While K = %d, N = %d, N_pe = %d\n",K,N,N_PE);
% diff = ops - extra_op;
% outputmat = [ops,extra_op,diff,extra_cc];
% fprintf("The [sch_extra_op,ex_extra_op,extra_cc] \n");
% disp(outputmat);

%% Latency
% Get the time of last input
Startime_last_input = K*(N-1);
% Get the time of last output
startTimeArrayOut = schedule(end:-1:end-N+1,10);
startTimeFirstOut = min(startTimeArrayOut);
Latency_sch = startTimeFirstOut - Startime_last_input;
Latency_exp = FFT_lat_1(N,K,N_PE);
fprintf("Expression latency is %d ,schedule latency is is %d\n",Latency_exp,Latency_sch);
