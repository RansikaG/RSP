L =100000; 
D = zeros(1,L); 
positions = randperm(L,L/2);
D(positions) = ones(1,L/2); 

%sequence of pulses
A = 1
S = -A*ones(1,L);
S(D==1)= A;

% AWGN
mean = 0;
sigma = 1;
N = mean + sigma*randn(1,L);

%Interference
meanI = 0;
sigmaI = 1;
I = meanI + sigmaI*randn(1,L);
%generating the received signal and plotting it
%R = S + N;
R = S + N + I;

%generating Y sequence
threshold = 0;
Y = -A*ones(1,L);
Y(R>threshold)=A;

bin_no=100;
R_max = max(R);
R_min = min(R);
width = (R_max-R_min)/bin_no;
bin_limits = R_min:width:R_max;

bins_centers = R_min+width/2:width:R_max-width/2;
frequency= zeros(1,bin_no);
for k=1:bin_no
    for j =1:L
        if (R(j)<=bin_limits(k+1)) && (R(j)>bin_limits(k))
            frequency(k)=frequency(k)+1;
        end
    end
end

figure;
bar(bins_centers,frequency,1);
title("Histogram of R");

figure;
hist(R,bin_no);
title("Histogram of R (Using hist())");

        
%pdf of f_R|S(r|S=A)
r_ifSA = R(S==A); %S = A
R_max1 = max(r_ifSA);
R_min1 = min(r_ifSA);
widthSA = (R_max1-R_min1)/bin_no; 
[y1,x1] = hist(r_ifSA,bin_no);
prob1 = y1/(length(r_ifSA)*widthSA);
figure;
bar(x1,prob1);
hold on;
plot(x1,prob1,'r');
title("pdf of f_{R|S}(r|S=A)");

%pdf of f_R|S(r|S=-A)
r_ifS_A = R(S==-A); %S = -A
R_max1 = max(r_ifS_A);
R_min1 = min(r_ifS_A);
widthS_A = (R_max1-R_min1)/bin_no; 
[y2,x2] = hist(r_ifS_A,bin_no);
prob2 = y2/(length(r_ifS_A)*widthS_A);
figure;
bar(x2,prob2);
hold on;
plot(x2,prob2,'r');
title("pdf of f_{R|S}(r|S=-A)");

%pdf of f_R
R_max = max(R);
R_min = min(R);
width= (R_max-R_min)/bin_no; 
[y,x] = hist(R,bin_no);
probR = y/(length(R)*width);
figure;
bar(x,probR);
hold on;
plot(x,probR,'r'); %plotting the pdf
title("pdf of f_R(r)");
    
%E[R|S=A]
E_R_ifSA = 0;
for i1 = 1:bin_no
    E_R_ifSA = E_R_ifSA + x1(i1)*prob1(i1)*widthSA;
end
E_R_ifSA

%E[R|S=-A]
E_R_ifS_A = 0;
for i2 = 1:bin_no
    E_R_ifS_A = E_R_ifS_A + x2(i2)*prob2(i2)*widthS_A;
end
E_R_ifS_A

%E[R]
E_R = 0;
for i3 = 1:bin_no
E_R = E_R + (x(i3)*probR(i3)*width);
end
E_R


