%getlowerbound(schedule,1:12)
tic
LB = zeros(4,1);
for i = 4: 7
   LB(i) =  getlowerbound(schedule,i);
end
toc
tic
LB1 = getlowerboundAr(schedule,5:8);
toc