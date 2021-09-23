function [butterfly_mat,butterfly_array] = FFT_mat(N)
%% Return the FFT ids of each layer
butterflyids =  N : N + (N/2)*log2(N) - 1 ;
butterfly_mat = reshape(butterflyids,[N/2,log2(N)]);
butterfly_mat = flip(butterfly_mat,2);
butterfly_array = reshape(butterfly_mat,[],1);
end