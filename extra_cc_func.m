function extra_cc =  extra_cc_func(N,K,N_pe)
extra_op =  extra_op_func(N,K,N_pe);
extra_cc = ceil(extra_op/N_pe);