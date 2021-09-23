% For given n-point FFT
% The twiddle can be expressed as a matrix
function tm = twid_mat(n)
%n = 8;
%twiddle_mat = [];
twiddle_mat = zeros(n/2,log2(n));
% %stages = log2(n);
for i = 1:log2(n)-1
     j = 2^(i-1); % inner loop
     twiddle_tmp = twiddle_mat(:,i);
     twiddle_tmp = reshape(twiddle_tmp,j,n/(j*2));
     for k = 1:j % iteration time 
         twiddle_tmp(k,:) = 0:j:n/2-1;
     end
     twiddle_tmp = concatinate(twiddle_tmp);
     %write back the matrix
     twiddle_mat(:,i) = twiddle_tmp;
end
%disp(twiddle_mat);
tm = twid_cal(twiddle_mat,n);
tm = tm.';
%disp(tm);
