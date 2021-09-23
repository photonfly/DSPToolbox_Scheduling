% This test code is used to test the latency calculation
N = 2048;
N_pe = 1;
K = 10;
%% old solution
extra_op = extra_op_func(N,K,N_pe); % operation be move
%disp(extra_op);
extra_op_interm = extra_op - N; % operation be move
%disp(extra_op_interm);
extra_cc = ceil(extra_op_interm/N_pe);
%disp(extra_cc);
latency_cc = extra_cc + K +1;
latency_sp = ceil(latency_cc/K);
fprintf('For the FFT where N = %d , K = %d, N_pe=%d\n',N,K,N_pe);
fprintf('The latency in cc is %d\n',latency_cc);
fprintf('The latency in samples is %d\n',latency_sp);

%% new solution
latency_cc_1 = FFT_lat_1(N,K,N_pe);
fprintf('The latency1 in cc is %d\n',latency_cc_1);

