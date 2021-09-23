function extra_op =  extra_op_func(N,K,N_pe)
if(K*N_pe > N-1)
    extra_op = 0;
else
    k = 0 : log2(N);
    N_br = (log2(N_pe)-1)*N_pe+1;
    sample_Stage = ceil((N./2.^(k+1)));
    operationsSample = 2.^(k)-1;
    extra_ccSample =  max(operationsSample - N_pe*K,zeros(1,log2(N)+1));
    mult = sample_Stage.*extra_ccSample;
    extra_op = sum(mult)+N_br;
end

