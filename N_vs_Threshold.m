clc;
close all;
clear all;
tt=[];
x=[];y=[];
for i=0:0.5:40
    tt=[tt i];
end
%disp(tt);
for i=0:2:16
    if i==0
       y=[y i+1];
    else
        y=[y i];
    end
end
%disp(y);
%snr=10;
N=20;K=16;
err1=[];err=[];snr1=[];
Pm=[];Pd=[];
Qd=0;Qf=0;
vec=['-+','-o','-v','-d','->','-x','-s','-<','-*','-^'];
snrvec=[-10 -5 0 5 10];
j=1;
for v=1:length(snrvec)
    %snr1=[snr1 -snr];
    snr=snrvec(v);
    %disp(snr)
    x=[];
    for n=0:2:16
        if n==0
            n=n+1;
        else
            n=n;
        end
        s=ones(1,N);
        w=randn(1,N); 
        u=N/2;%Time-delay bandwidth product
        err=[];err1=[];z=0;
        for t=1:0.5:40 
             Qd=0;
             Qf=0;
             SNR=10^((-snr)/10); %for linear scale 
             a=sqrt(2*SNR);
             b=sqrt(t);
             Pd = marcumq(a,b,u ); % AVG. PROB OF DETECTION(computes the generalized Marcum Q)
             Pf = gammainc((t/2),u,'upper');% AVG. PROB OF FALSE ALARM(compute incompelete gamma function)
             Pm=1-Pd;                %AVG. PROB OF MISSED DETECTION OVER AWGN        
             for l=n:1:K
                   Qd=Qd+(factorial(K)*(Pd^l)*((1-Pd)^(K-l))/(factorial(l)*factorial(K-l)));
                   Qf=Qf+(factorial(K)*(Pf^l)*((1-Pf)^(K-l))/(factorial(l)*factorial(K-l)));
             end
             Qm=1-Qd;
             err=Qf+Qm;
             err1=[err1 err];
         end
         [minerr,index]=min(err1);
         x=[x tt(index)];
    end
     plot(x,y,vec(j:j+1),'LineWidth',1.5);
     j=j+2;
     hold on;
end
grid on;
%disp(snr1);
xlim([0 40]);
ylim([2 16]);
ylabel('Number of Users');
xlabel('Corresponding threshold value to be set for minimum error');
title('Users vs Threshold');
legend('snr=-10','snr=-5','snr=0','snr=5','snr=10');