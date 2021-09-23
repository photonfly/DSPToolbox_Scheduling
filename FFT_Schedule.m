%% Generate the SFG 
sfg_FFT; 

%% Generate the Schedule
timinginfo = getdefaulttiminginfo;
schedule = getinitialschedule(sfg, timinginfo,20);
printschedule(schedule);

printstarttimes(schedule);
delay = 10;
schedule = changestarttime(schedule, 'out', 8 , delay+1);
schedule = changestarttime(schedule, 'out', 9 , delay+2);
schedule = changestarttime(schedule, 'out', 10 , delay+3);
schedule = changestarttime(schedule, 'out', 11 , delay+4);

delay_butterfly = 5;
schedule = changestarttime(schedule, 'butterfly2', 5 ,delay_butterfly + 2);
schedule = changestarttime(schedule, 'butterfly2', 4 ,delay_butterfly +  1);
schedule = changestarttime(schedule, 'butterfly2', 7 ,delay_butterfly +  1);
schedule = changestarttime(schedule, 'butterfly2', 6 ,delay_butterfly +  1);


%% make input in rate of 2
input_rate = 2;
for i = 0:3
    schedule = changestarttime(schedule, 'in', i ,i*input_rate);
end
schedule = changestarttime(schedule, 'butterfly2', 6 ,-2);
schedule = changestarttime(schedule, 'butterfly2', 5 ,-1);

for out_id = 8:11
    schedule = changestarttime(schedule, 'out', out_id, -5);
end

plotschedule(schedule);
printstarttimes(schedule);