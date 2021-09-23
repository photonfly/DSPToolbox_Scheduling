
N = 4;
% butterflyids =  N : N + (N/2)*log2(N) -function op_id = find_op_id(butterfly_array,N,btf_id);
% butterfly_mat = reshape(butterflyids,[N/2,log2(N)])
% butterfly_mat = flipdim(butterfly_mat,2)
% butterfly_array = reshape(butterfly_mat,[],1)
[butterfly_mat,butterfly_array] = FFT_mat(N);