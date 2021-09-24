function schedule = moveoperand(schedule, btf_id,target)
starttime = getstarttimes(schedule,'butterfly2', btf_id);
distance = target - starttime;
schedule = changestarttime(schedule, 'butterfly2', btf_id, distance);
end
