function sfg = FFT_gen(N)
% To generate FFT sfg for given number of N

sfg = [];
% if n = 2;
n = N;
id_max = n*(log2(n)+1);
id_mat = 1 : id_max;
id_mat = reshape(id_mat,n,log2(n)+1);
id = 0;
%Generate the twid matrix
Twiddle_matrix = twid_mat(n);

%inputs
for i = 1:n
    sfg = addoperand(sfg, 'in', id, i);
    id = id + 1;
end
id_btf =N/2*log2(N);
%iteration times
%reversed way,from right to left
for i = 1 : log2(n) % layers
    j = 2^i; % step length
    inputs = id_mat(:,end-i);
    outputs = id_mat(:,end-i + 1);
    twiddle_array = Twiddle_matrix(:,end + 1 - i);
    % add butterfly layer by layer
    for k = 1:j:n
       % [sfg,id] = add_butterfly(sfg,id,inputs(k:k+j-1),outputs(k:k+j-1));
        [sfg,id_btf] = add_butterfly(sfg,id_btf,inputs(k:k+j-1),outputs(k:k+j-1),twiddle_array);
    end
end

% Add butterflies From left to right
% for i = 1 : log2(n) % layers
%     j = 2^i; % step length
%     inputs = id_mat(:,i);
%     outputs = id_mat(:,i + 1);
%     twiddle_array = Twiddle_matrix(:,end + 1 - i); %does not matter
%     add butterfly layer by layer
%     for k = 1:j:n
%        [sfg,id] = add_butterfly(sfg,id,inputs(k:k+j-1),outputs(k:k+j-1));
%         [sfg,id_btf] = add_butterfly(sfg,id_btf,inputs(k:k+j-1),outputs(k:k+j-1),twiddle_array);
%     end
% end
%outputs
for i = id_max-n+1:id_max
    sfg = addoperand(sfg, 'out', id, i);
    id = id + 1;
end

end