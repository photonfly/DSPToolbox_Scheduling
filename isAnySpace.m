function [anySpace, btf_id_move,min_value] = isAnySpace(schedule,ids)
% To check if there is any space for moving the butterfly
% Input: schedule
% Output: anySpace, 
% 0. Get time_mate for butterfly
% time_mat = gettimemat(schedule);
% time_mat_btf = time_mat(:,ids);

% Op_number = length(ids);
% 1. Get the lower bound array
%lower_bound = time_mat_btf(2,:);
% lower_bound = zeros(Op_number,1);
lower_bound = getlowerboundAr(schedule,ids);

% for i = 1:Op_number 
%    lower_bound(i) = getlowerbound(schedule,ids(i));
% end
btf_id = schedule(ids+1,2);
% 2. find the min value
[min_value,index] = min(lower_bound);
if (min_value<0)
    % 3. Find the index of the butterfly to be moved
    anySpace = 1;
    btf_id_move =  btf_id(index);
else
    anySpace = 0; % No space to move
    btf_id_move = -1;
end