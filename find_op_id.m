function op_id = find_op_id(butterfly_array,N,btf_id)
    idx = butterfly_array == btf_id ;
    operation_id = N+1 : N + (N/2)*log2(N); 
    op_id = operation_id(idx);
end 