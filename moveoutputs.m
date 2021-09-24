function schedule = moveoutputs(schedule, op_id,target)
starttime = getstarttimes(schedule,'out', op_id);
distance = target - starttime;
schedule = changestarttime(schedule, 'out', op_id, distance);
end