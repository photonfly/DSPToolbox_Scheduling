N = [8,16,32,64,128,256];
K = [2,3,7];
N_pe = 4;
%% Extra_cc expression
% sample_Stage = (N./2.^(k+1));
% sample_Stage(end) = 1;
% sample_Stage = ceil((N./2.^(k+1)));
% operationsSample = 2.^(k)-1;
% extra_ccSample =  max(operationsSample - K,zeros(1,log2(N)+1));
% mult = sample_Stage.*extra_ccSample;
% extra_cc = sum(mult);
for i = 1:3
    fprintf("when the K is %d \n",K(i));
    for j = 1:6
        extra_cc = extra_cc_func(N(j),K(i),N_pe);
        fprintf("the N is %d,the extra_cc is %d\n",N(j),extra_cc);
    end
end