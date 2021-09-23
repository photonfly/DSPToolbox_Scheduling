% fft_length = input('Enter FFT length:');
% for mm = 0:1:(fft_length-1)
%     theta = (-2*pi*mm*1/fft_length);
% %   Twiddle factor equation
% %   twiddle = exp(1i*theta);
% %   Euler equation for complex exponential 
% %   e^(j*theta) = cos(theta) + j(sin(theta)) 
%     
%     twiddle(mm+1) = cos(theta) + (1i*(sin(theta)));
%     real_twiddle = real(twiddle);
%     real_twiddle = real_twiddle'
%     im_twiddle = imag(twiddle);
%     im_twiddle = im_twiddle'
%     
% end
% Filename:  FFT_Twiddles_Find_DSPrelated.m

%  Computes 'Decimation in Frequency' or 'Decimation 
%  in Time' Butterfly twiddle factors, for radix-2 FFTs 
%  with in-order input indices and scrambled output indices.
%  
%  To use, do two things: (1) define FFT size 'N'; and 
%  (2) define the desired 'Structure', near line 17-18, 
%  as 'Dec_in_Time' or 'Dec_in_Freq'.
%
%  Author: Richard Lyons, November, 2011
%******************************************

clear, clc

% Define input parameters
N = 8; % FFT size (Must be an integer power of 2)
Structure = 'Dec_in_Time';  % Choose Dec-in-time butterflies
%Structure = 'Dec_in_Freq';  % Choose Dec-in-frequency butterflies

% Start of processing
Num_Stages = log2(N); % Number of stages
StageStart = 1; % First stage to compute
StageStop = Num_Stages; % Last stage to compute
ButterStart = 1; %First butterfly to compute
ButterStop = N/2; %Last butterfly to compute
Pointer = 0; %Init 'results' row pointer
for Stage_Num = StageStart:StageStop
if Structure == 'Dec_in_Time'
	  for Butter_Num = ButterStart:ButterStop
	    Twid = floor((2^Stage_Num*(Butter_Num-1))/N);
	    % Compute bit reversal of Twid
	    Twid_Bit_Rev = 0; 
	    for I = Num_Stages-2:-1:0
		if Twid>=2^I
		  Twid_Bit_Rev = Twid_Bit_Rev + 2^(Num_Stages-I-2);
		  Twid = Twid -2^I;
		else, end
	    end %End bit reversal 'I' loop
	    A1 = Twid_Bit_Rev; %Angle A1
	    A2 = Twid_Bit_Rev + N/2; %Angle A2
	    Pointer = Pointer +1;
	    Results(Pointer,:) = [Stage_Num,Butter_Num,A1,A2];
	  end
     else
	  for Twiddle_Num = 1:N/2^Stage_Num
	    Twid = (2^Stage_Num*(Twiddle_Num-1))/2; %Compute integer
	    Pointer = Pointer +1;
	    Results(Pointer,:) = [Stage_Num,Twiddle_Num,Twid];
	  end 
    end % End 'if'
end % End Stage_Num loop

Results(:,1:3), disp(' Stage#  Twid#   A'), disp(' ')