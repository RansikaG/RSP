L = 50; %change this to 100000 for question 5
%generating a equiprobable binary sequence
D = zeros(1,L); %generating a sequence of thousand zeros
positions = randperm(L,L/2); %choosing 500 numbers randomly between 1 and 1000 without replacement
D(positions) = ones(1,L/2); %replacing the zeros in D with ones in the randomly chosen places

%sequence of pulses
A = 1;
S = -A*ones(1,L);
S(D==1)= A;

% AWGN
mean = 0;
sigma = 1;
N = mean + sigma*randn(1,L);
%generating the received signal and plotting it
R = S + N;

%generating Y sequence
threshold = 0;
Y = -A*ones(1,L);
Y(R>threshold)=A;

%generating the bins sequence
bin_n = 2; %change this to 100 for question 5(a)
R_max = max(R);
R_min = min(R);
width = (R_max-R_min)/(bin_n);
bins_limits = linspace(R_min,R_max,bin_n+1);
%counting y values for each bin
bins = zeros(bin_n);

R_sorted=sort(R);



