function latency =  FFT_lat(N,K,N_pe)
extra_op =  extra_op_func(N,K,N_pe);
intem_op = extra_op - N;
extra_cc = ceil(intem_op/N_pe);
latency = extra_cc/K+K*N;


