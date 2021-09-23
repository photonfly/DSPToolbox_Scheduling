function sequence_mat = btf_sequence_gen(schedule,ids)
len = size(ids,2);%How many ops to be moved
init_mat = zeros(len,3);
init_mat(:,1) = schedule(ids+1,2);  %ids
init_mat(:,2) = schedule(ids+1,end - 2);  %starttimes
init_mat(:,3) = ids;  %address
sequence_mat = sortrows(init_mat,2);
