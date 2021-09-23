function [sfg,id_o] = add_butterfly(sfg,id,inputs,outputs,twf_array)
for i = length(inputs)/2 :-1:1
%for i = 1:length(inputs)/2 
     sfg = addoperand(sfg, 'butterfly2', id,[inputs(i),inputs(i+length(inputs)/2)],[outputs(i),outputs(i+length(inputs)/2)],twf_array(i));      
     id = id - 1; 
end
id_o = id;
end