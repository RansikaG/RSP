L =100000; %change this to 100000 for question 5
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

bin_n=100;
R_max = max(R);
R_min = min(R);
width = (R_max-R_min)/bin_n;
bins = linspace(R_min,R_max,bin_n);

frequency= zeros(1,bin_n);
for i = 1:L
    for k = 1:bin_n-1
        if (R(i) >= bins(k)) && (R(i) <= bins(k+1))
            frequency(k) = frequency(k) + 1;
        end
    end
end

%plotting the histogram
figure;
bar(bins,frequency,1);
title("Histogram of R");
%using the buit in function hist()
figure;
hist(R,bin_n);
title("Histogram of R (Using hist())");
%
        
    
    



