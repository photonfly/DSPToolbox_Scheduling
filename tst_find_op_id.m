
N = 4;
% butterflyids =  N : N + (N/2)*log2(N) -function op_id = find_op_id(butterfly_array,N,btf_id);
% butterfly_mat = reshape(butterflyids,[N/2,log2(N)])
% butterfly_mat = flipdim(butterfly_mat,2)
% butterfly_array = reshape(butterfly_mat,[],1)

% Generate SFG

% btf_id = 7;
% idx = find(butterfly_array == btf_id) ;
% operation_id = N+1 : N + (N/2)*log2(N); 
[butterfly_mat,butterfly_array] = FFT_mat(N);
btf_id = 4;
op_id = find_op_id(butterfly_array,N,btf_id)