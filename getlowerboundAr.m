function [LB]=getlowerboundAr(schedule,op_i,s)
% gets the Lower bound  on start-time

%schedule=sch_direct; (debug only!)
%extract CFG
size_schedule=size(schedule);
scheduletime=schedule(1,1);
nlcolumns = schedule(1,2);

sfg=schedule(2:size_schedule(1),:);

%time info computation
time_columns_index=size_schedule(2)-2-nlcolumns;
timecol = [time_columns_index:size_schedule(2)];
numberoflaps = sfg(:,timecol(1):timecol(nlcolumns));
starttime = sfg(:,timecol(nlcolumns+1));
endtime = starttime + sfg(:,timecol(nlcolumns+2));

for ix = 1:length(endtime)
    if endtime(ix) > scheduletime
        endtime(ix)=mod(endtime(ix),scheduletime);
    end
end
%get the inout nodes of SFG to be used later
%invec=-1*ones(length(sfg(:,1)),4);
outvec=-1*ones(length(sfg(:,1)),4);
if nargin < 3
    s = operandstructure;
end
for ix = 1:length(sfg(:,1))
    [inn,outn]=getinoutnodes_op(sfg(ix,:), s);
    
    %     if isempty(inn)
    %         invec(ix,1:4) = -1;
    %     else
    %         l=size(inn);
    %         invec(ix,1:l(2))=inn(1:l(2));
    %     end
    if isempty(outn)
        outvec(ix,1:4) = -1;
    else
        l=length(outn);
        outvec(ix,1:l)=outn;
    end
end

%------------------------------------------
% LB Logic discussed with oscarg
%-------------------------------------------
LB = zeros(length(op_i),1);
for i = 1:length(op_i)
    [innodes, ~] = getinoutnodes_op(sfg(op_i(i),:),s);
    if (isempty(innodes))
        LB(i) = -starttime(op_i(i)) ;
    else
        LB_int = zeros(1,length(innodes));

        for ix = 1:length(innodes)
            %[op_ind,inp_ind]=get_opindices_backward(sfg,innodes(ix));
            [op_ind]=find(innodes(ix) == outvec);
            if (op_ind > length(sfg(:,1)))
                op_ind = mod(op_ind,length(sfg(:,1)));
                if (op_ind == 0)
                    op_ind = length(sfg(:,1));
                end
            end
            %        nl_index=find(innodes(ix) == invec(op_i,:));
            nl_index = ix; % ?!?
            if starttime(op_i(i)) >= endtime(op_ind)
                LB_int(ix) = -starttime(op_i(i))+endtime(op_ind)-numberoflaps(op_i(i),nl_index)*scheduletime;
            else
                LB_int(ix) = -starttime(op_i(i))+endtime(op_ind)-numberoflaps(op_i(i),nl_index)*scheduletime-scheduletime;

            end

            %disp(LB_int)
        end
        LB(i) = max(LB_int);
    end
end





