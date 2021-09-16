L = 1000; %change this to 100000 for question 5
%generating a equiprobable binary sequence
D = zeros(1,L); %generating a sequence of thousand zeros
positions = randperm(L,L/2); %choosing 500 numbers randomly between 1 and 1000 without replacement
D(p) = ones(1,L/2); %replacing the zeros in D with ones in the randomly chosen places
A = 1;
%generating a sequence of pulses
S = zeros(1,L); %generating a sequence of thousand zeros
for i = 1:L
if D(i) == 0 %assigning -A if D = 0
S(i) = -1*A;
else
S(i) = A; %assigning A if D = 1
end
end
%generating AWGN with mean = 0 and variance = 1
m = 0;
sigma = 1;
N = m + sigma*randn(1,L);
%generating the received signal and plotting it
R = S + N;
figure;
stairs([1:L],R);
title("Received Signal");