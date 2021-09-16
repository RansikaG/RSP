L = 1000; %change this to 100000 for question 5
%generating a equiprobable binary sequence
D = zeros(1,L); %generating a sequence of thousand zeros
positions = randperm(L,L/2); %choosing 500 numbers randomly between 1 and 1000 without replacement
D(positions) = ones(1,L/2); %replacing the zeros in D with ones in the randomly chosen places
figure;
stairs(1:L,D);
axis([0 L -0.5 1.5])
title("Binary Sequence");

%sequence of pulses
A = 1;
S = -A*ones(1,L);
S(D==1)= A;

figure;
stairs(1:L,S);
axis([0 L -1*A-1 A+1])
title("Transmitted Signal");

% AWGN
mean = 0;
sigma = 1;
N = mean + sigma*randn(1,L);
%generating the received signal and plotting it
R = S + N;
figure;
stairs(1:L,R);
%axis([0 L -1.5*A 1.5*A])
title("Received Signal");


%generating Y sequence
threshold = 0;
Y = -A*ones(1,L);
Y(R>threshold)=A;
%plotting transmitted signal and Y sequence and comparing
figure;
subplot(2,1,1);
stairs([1:L],S);
axis([0 50 -1*A-1 A+1])
title("Transmitted Signal");

subplot(2,1,2);
stairs([1:L],Y);
axis([0 50 -1*A-1 A+1])
title("Y Signal");
