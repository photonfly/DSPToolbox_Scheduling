function result = twid_cal(k,N)

k = k';
result = cos(2*pi*k/N)+1i*sin(-2*pi*k/N);
end