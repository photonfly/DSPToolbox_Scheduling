function [schedule]=getinitialschedule(sfg,timinginfo,scheduletime,inputtimes)
% Produces the Computation Graph for a given SFG
% latency and execution time are positive integer numbers

% sfg = sfg_direct;
% latency = 2;
% executiontime = 2;
%scheduletime = 6;
if nargin < 2
    error('Not enough input arguments');
end

if nargin > 4
    error('Too many input arguments');
end
delay_opname='delay';

delay_op = getidfromname(delay_opname);

% Play it safe always sort the SFG.
[sfg,~]=sortsfg(sfg);
s=size(sfg);

% Get the initial start/end times,cp and number of laps
if nargin == 4
    [starttime,lat_vec,exe_vec,~,criticalpath,numberoflaps]=get_timinginfo(sfg,timinginfo,inputtimes);
else 
    [starttime,lat_vec,exe_vec,~,criticalpath,numberoflaps]=get_timinginfo(sfg,timinginfo);
end

if nargin == 2 || scheduletime <= 0
    scheduletime = criticalpath;
end
% must remove the delay elements from schedule
delay_indices =  find(sfg(:,1) == delay_op);
num_delayops = length(delay_indices);
newrows = s(1) - num_delayops;

delay_opnum = zeros(1,num_delayops);
for ii = 1:num_delayops
    delay_opnum(ii) = sfg(delay_indices(ii),2);
end
for ij = 1:num_delayops
    [sfg]=deleteoperand(sfg,delay_opname,delay_opnum(ij));
end
% Form a new matrix with SFG and timing info

nsfg = [sfg numberoflaps(1:newrows,:) starttime(1:newrows)' lat_vec(1:newrows)' exe_vec(1:newrows)'];
s_nsfg = size(nsfg);


schedule = zeros(s_nsfg(1)+1,s_nsfg(2));
schedule(1,1) = scheduletime;
schedule(1,2) = size(numberoflaps,2);
schedule(1,3:s_nsfg(2)) = NaN;
schedule(2:s_nsfg(1)+1,:) = nsfg;

