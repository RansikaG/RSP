L = 50; %change this to 100000 for question 5
%generating a equiprobable binary sequence
D = zeros(1,L); %generating a sequence of thousand zeros
positions = randperm(L,L/2); %choosing 500 numbers randomly between 1 and 1000 without replacement
D(positions) = ones(1,L/2); %replacing the zeros in D with ones in the randomly chosen places
figure;
stairs(1:L,D);
axis([0 L -0.5 1.5])
title("Received Signal");
A = 1;
%generating a sequence of pulses
S = -A*ones(1,L); %generating a sequence of thousand zeros
S(D==1)= A;

figure;
stairs(1:L,S);
axis([0 L -1.5*A 1.5*A])
title("Received Signal");
%generating AWGN with mean = 0 and variance = 1
mean = 0;
sigma = 1;
N = mean + sigma*randn(1,L);
%generating the received signal and plotting it
R = S + N;
figure;
stairs(1:L,R);
axis([0 L -1.5*A 1.5*A])
title("Received Signal");