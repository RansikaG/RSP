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

        
%pdf of f_R|S(r|S=A)
r_ifSA = R(S==A); %list containing R values when S = A
R_max1 = max(r_ifSA);
R_min1 = min(r_ifSA);
width_1 = (R_max1-R_min1)/bin_n; 
bins_centers_1 = R_min1+width_1/2:width_1:R_max1; 
[y1,x1] = hist(r_ifSA,bins_centers_1);
prob1 = y1/(length(r_ifSA)*width_1);
figure;
bar(x1,prob1);
hold on;
plot(x1,prob1,'r'); %plotting the pdf
title("pdf of f_{R|S}(r|S=A)");

%pdf of f_R|S(r|S=-A)
r_ifS_A = R(S==-A); %list containing R values when S = A
R_max1 = max(r_ifS_A);
R_min1 = min(r_ifS_A);
width_1 = (R_max1-R_min1)/bin_n; 
bins_centers_1 = R_min1+width_1/2:width_1:R_max1; 
[y2,x2] = hist(r_ifS_A,bins_centers_1);
prob2 = y2/(length(r_ifS_A)*width_1);
figure;
bar(x2,prob2);
hold on;
plot(x2,prob2,'r'); %plotting the pdf
title("pdf of f_{R|S}(r|S=-A)");
    



