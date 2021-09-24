function btf_ids = second_last_trans(N)
N_op = N/2*log2(N);
btf_ids = N_op-N/2:-1:N_op-N+1;
% disp(btf_ids);
btf_ids = reshape(btf_ids,[2,N/4]);
btf_ids([1,2],:)=btf_ids([2,1],:);
btf_ids = reshape(btf_ids,[N/2,1]);
