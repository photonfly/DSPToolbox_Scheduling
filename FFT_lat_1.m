function latency = FFT_lat_1(N,K,N_pe)
    k = 0 : log2(N);
    N_br = (log2(N_pe)-1)*N_pe+1;
    sample_Stage = ceil((N./2.^(k+1)));
    operationsSample = 2.^(k)-1;
    extra_ccSample =  max(operationsSample - N_pe*K,zeros(1,log2(N)+1));
    mult = sample_Stage.*extra_ccSample;
    extra_op = sum(mult)+N_br;
    intem_op = extra_op - N/2;
    intem_cc = ceil((intem_op+1)/N_pe);
    latency = K+intem_cc; 
   
    %latency = ceil((sum(mult)-N/2+1)/N_pe)+K+log2(N_pe);