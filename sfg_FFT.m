%function sfg = sfg_FFT(n);
%
%For given n point FFT
% sfg_FFT  Signal flow graph for n point FFT

% Check the filter order
clc;
clear;
close all;
sfg = [];
% if n = 2;
n = 4;
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
%iteration times
for i = 1 : log2(n)
    j = 2^i; % step length
    inputs = id_mat(:,end-i);
    outputs = id_mat(:,end-i + 1);
    twiddle_array = Twiddle_matrix(:,end + 1 - i);
    % add butterfly layer by layer
    for k = 1:j:n
       % [sfg,id] = add_butterfly(sfg,id,inputs(k:k+j-1),outputs(k:k+j-1));
        [sfg,id] = add_butterfly(sfg,id,inputs(k:k+j-1),outputs(k:k+j-1),twiddle_array);
    end
end
%outputs
for i = id_max-n+1:id_max
    sfg = addoperand(sfg, 'out', id, i);
    id = id + 1;
end

printsfg(sfg);
plotprecedence(sfg);

%% Arithmetic tests
% Test of butterfly
% input_data = [1;3];
% %[output,outid] = simulate(sfg,input_data);
% [out,out_id] = simulate(sfg, input_data,[0,1]);
% Y = fft(input_data,2);
% isequal(out,Y)

%% Arithmetic tests
% % Test of 4 Point FFT
% input_data = [1;3;6;7];
% %[output,outid] = simulate(sfg,input_data);
% [out,out_id] = simulate(sfg, input_data,0:3);
% Y = fft(input_data,4);
% isequal(out,Y)
%% Arithmetic tests
% Test of 4 Point FFT
% input_data = [1;3;6;7;1;3;6;7];
% %[output,outid] = simulate(sfg,input_data);
% [out,out_id] = simulate(sfg, input_data,0:7);
% Y = fft(input_data,8);
% isequal(out,Y)
