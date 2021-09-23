function[starttime,lat_vec,exe_vec,endtime,criticalpath,numberoflaps]=get_timinginfo(sfg,timinginfo,inputtimes)
% Computes the starttime,endtime and critical path given
% sfg = sfga;
% latency = 2;
% executiontime=2;
s = operandstructure;

numberofops = size(sfg,1);
[sfg,~]=sortsfg(sfg);
[~,outv]=get_inoutnodelist(sfg, s);

maxinnodes=0;

starttime=zeros(1,numberofops);
if nargin == 3
    starttime(1:length(inputtimes))=inputtimes;
end

for ix = 1:numberofops
    [inn,~]=getinoutnodes_op(sfg(ix,:), s);
    maxinnodes = max(maxinnodes, length(inn));
    if ~(isempty(inn))
        l=size(inn);
        start_variable = zeros(1, l(2));
        
        for iy = 1 : l(2)
            op_i=(find(inn(iy) == outv));
            op_i=mod(op_i,length(sfg));
            if op_i == 0
                op_i =length(sfg);
            end
            runtime = getfield(timinginfo, s(sfg(op_i,1)).name);
%            if (s(sfg(op_i,1)).notarithmetic)
%                runtime = 0;
%            else
%                runtime = latency;
%            end
            start_variable(iy)=starttime(op_i)+runtime.latency;
        end
        starttime(ix)=max(start_variable);
        
    end
end

%write code to put start time = NaN and latency = 0 for delay
lat_vec = zeros(1, length(sfg(:,1)));
exe_vec = zeros(1, length(sfg(:,1)));

for i = 1 : numberofops
    optiming = getfield(timinginfo, s(sfg(i,1)).name);
    lat_vec(i) = optiming.latency;
    exe_vec(i) = optiming.executiontime;
end

endtime = starttime + lat_vec ;
% for im = length(endtime)
%     if(endtime(im) > scheduletime)
%         endtime(im) = mod(endtime(im),scheduletime);
%     end
% end

%------------------------------------------------------------------------
%Critical path Computation
% Remove the endtimes of all input,output and delay instr
% CP = maxendtime

et_arith = zeros(1,numberofops);
for  ij = 1:numberofops
    if ~s(sfg(ij,1)).notarithmetic
        et_arith(ij)=endtime(ij);
    end
end

criticalpath=max(et_arith);
%--------------------------------------------------------------------------
%----Number of laps

number_laps=NaN*ones(numberofops,maxinnodes);

for ix = 1:numberofops
    
    if (s(sfg(ix,1)).notarithmetic)
        number_laps(ix,1) = 0;
        
    else
        [inn,~]=getinoutnodes_op(sfg(ix,:),s);
        l=size(inn);
        for iy = 1 : l(2)
            nn=inn(iy);
            [dc,pn]=get_delaycount(sfg,nn, s);
            if dc ~= 0
                op_i=(find(pn == outv));
                op_i=mod(op_i,length(sfg));
                if op_i == 0
                    op_i =length(sfg);
                end
                if starttime(ix) < endtime(op_i)
                    %                     %special case
                    %                     if (starttime(ix) == 0) & (endtime(op_i) == criticalpath)
                    %                         number_laps(ix,iy) = dc;
                    %                     else
                    number_laps(ix,iy) = dc - 1;
                    %                     end
                else
                    number_laps(ix,iy) = dc ;
                end
            else
                number_laps(ix,iy) = 0;
                
            end
        end
        
    end
    
end

numberoflaps = number_laps;



%--------------------------------------------------------------------





