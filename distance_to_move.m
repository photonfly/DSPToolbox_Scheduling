function [distance,start_time_aftermove_0] = distance_to_move(schedule, btf_id_move, min_value,startime_array,N_PE)
    start_time = getstarttimes(schedule,'butterfly2',btf_id_move);
    start_time_aftermove = start_time + min_value;
    max_time = max(startime_array); %the max startime exist
    iterations = 0;
    if(N_PE ~= 0)% If there is a contrain on Number of PE
        if(start_time_aftermove <= max_time)
             while(iterations < size(startime_array,2))
                N_same = sum(startime_array == start_time_aftermove);
                if(N_same < N_PE) %Enought slots
                %It can directly move to the min value
                    start_time_aftermove_0 = start_time_aftermove;
                    %
                    break;
                else %check next slot
                    start_time_aftermove = start_time_aftermove+1;
                    iterations = iterations+1;
                end
                    start_time_aftermove_0 = start_time_aftermove;
                    %distance = start_time_aftermove - start_time  ;
             end
             distance = start_time_aftermove - start_time;
        else
            %start_time_aftermove_0 = max_time + 1;
            distance = start_time_aftermove - start_time  ;
            start_time_aftermove_0 = start_time_aftermove;
        end
    else  %If no contrain, distance returns the min_value    
        distance = min_value;
        start_time_aftermove_0 = start_time_aftermove;
    end
end