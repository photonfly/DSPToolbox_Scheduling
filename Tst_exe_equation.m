close all;
clear;
clc;

N = 128;
K = [1,2,4,8];
Texe = K*(N - 1) + log2(N) - 1;