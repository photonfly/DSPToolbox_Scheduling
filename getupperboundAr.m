function  UB_vec=getupperbound(schedule,op_i, s)
% gets the Upper bound  on start-time

%   schedule=sch_trans_new; %(debugging only !)
%    op_i = 3;
%extract CFG
size_schedule=size(schedule);
scheduletime=schedule(1,1);
nlcolumns = schedule(1,2);
sfg=schedule(2:size_schedule(1),:);

%time info computation
time_columns_index=size_schedule(2)-2-nlcolumns;
timecol = time_columns_index:size_schedule(2);
numberoflaps = sfg(:,timecol(1:nlcolumns));
starttime = sfg(:,timecol(nlcolumns+1));
endtime = starttime + sfg(:,timecol(nlcolumns+2));
for ix = 1:length(endtime)
    if endtime(ix) > scheduletime
        endtime(ix)=mod(endtime(ix),scheduletime);
    end
end


%get the inout nodes of SFG to be used later
invec=-1*ones(length(sfg(:,1)),4);
if nargin < 3
    s = operandstructure;
end

for ix = 1:length(sfg(:,1))
    [inn,~]=getinoutnodes_op(sfg(ix,:), s);
    
    if isempty(inn)
        invec(ix,1:4) = -1;
    else
        l=length(inn);
        invec(ix,1:l)=inn;
    end
end

%------------------------------------------
% UB - Logic discussed with Oscarg.
%-------------------------------------------
[~, outnodes] = getinoutnodes_op(sfg(op_i,:),s);
UB_vec = [];
for ix = 1:length(outnodes)
    [op_ind]=find(outnodes(ix) == invec);
    % this will give me all the instr nummers that are forward indexed
    for ik = 1:length(op_ind)
        l=length(sfg(:,1));
        if (op_ind(ik) > l)
            op_ind(ik) = mod(op_ind(ik),l);
            if (op_ind(ik) == 0)
                op_ind(ik) = l;
            end
        end
    end
    %        [op_ind]=find(any(outnodes(ix) == invec));
    for iy = 1:length(op_ind)
        [inn, ~] = getinoutnodes_op(sfg(op_ind(iy),:),s);
        nl_index=find(outnodes(ix) == inn);
        %            nl_index=find(outnodes(ix) == invec(iy,:)); % ?!?
        for nl_i=nl_index
            if starttime(op_ind(iy)) >= endtime(op_i)
                UB_int = starttime(op_ind(iy))-endtime(op_i)+numberoflaps(op_ind(iy),nl_i)*scheduletime;
            else
                UB_int = starttime(op_ind(iy))-endtime(op_i)+scheduletime+numberoflaps(op_ind(iy),nl_i)*scheduletime;
            end
            % disp(UB_int) %for debugging
            %UB_vec=[UB_vec; [UB_int ix op_ind(iy)]];
        end
    end
end
UB_vec = UB_int;








