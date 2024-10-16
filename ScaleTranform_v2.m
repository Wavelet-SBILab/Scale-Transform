% Paper Ref: Unified Framework for Linear Scale Invariant Signals, Systems, and Transforms: A Tutorial
% Digital Signal Processing
% Generate Fig. 4, Fig. 5 and Fig. 6 of the paper

close all;
clear all;


set(0,'defaulttextInterpreter','latex') %latex axis labels

L=1; C=1; R=1; % 

w1=(0:1/1000:1000)*2*pi; a=0.1; b=1;

a1=[0.1 0.2 0.4 0.8];

%%%%%%%%%%%%%%%%% LPF %%%%%%%%%%%%%%%%%%%

for k=1:length(a1)
    i=1;
    a=a1(k);
    for i=1:length(w1)
        w=w1(i);
        Tw1=1/(L*C); % lowpass
        Tw2=(1i*w)^(a+b) + ((1i*w)^(a))*R/L + 1/(L*C);
        Tw(i)=Tw1./Tw2;
    end
    Tmatrix(:,k)=Tw;
end

subplot(2,1,1)
semilogx((w1), 20*log10(abs(Tmatrix)),'LineWidth',2)

xlabel('$\omega$ (rad/s)')
ylabel('Magnitude (dB)')
legend('\alpha=0.1','\alpha=0.2','\alpha=0.4','\alpha=0.8');
title('Low-pass Filter');

subplot(2,1,2)
semilogx(w1, angle(Tmatrix),'LineWidth',2)
xlabel('$\omega$ (rad/s)')
ylabel('Phase')
legend('\alpha=0.1','\alpha=0.2','\alpha=0.4','\alpha=0.8');


%%%%%%%%%%%%%%%%% HPF %%%%%%%%%%%%%%%%%%%
L=1; C=1; R=1; 


for k=1:length(a1)
    i=1;
    a=a1(k);
    for i=1:length(w1)
        w=w1(i);
        Tw1=(1i*w)^(a+b); % Highpass        
        Tw2=(1i*w)^(a+b) + ((1i*w)^(a))*R/L + 1/(L*C);
        Tw(i)=Tw1./Tw2;
    end
    Tmatrix(:,k)=Tw;
end
figure;
subplot(2,1,1)
semilogx((w1), 20*log10(abs(Tmatrix)),'LineWidth',2)

xlabel('$\omega$ (rad/s)')
ylabel('Magnitude (dB)')
legend('\alpha=0.1','\alpha=0.2','\alpha=0.4','\alpha=0.8');
title('High-pass Filter');

subplot(2,1,2)
semilogx(w1, angle(Tmatrix),'LineWidth',2)
xlabel('$\omega$ (rad/s)')
ylabel('Phase')
legend('\alpha=0.1','\alpha=0.2','\alpha=0.4','\alpha=0.8');

%%%%%%%%%%%%%%%%% BPF %%%%%%%%%%%%%%%%%%%
L=10^(-1); C=10^(-1); R=1; %


for k=1:length(a1)
    i=1;
    a=a1(k);
    for i=1:length(w1)
        w=w1(i);
        Tw1=((1i*w)^(a))*R/L; % Bandpass
        Tw2=(1i*w)^(a+b) + ((1i*w)^(a))*R/L + 1/(L*C);
        Tw(i)=Tw1./Tw2;
    end
    Tmatrix(:,k)=Tw;
end
figure
subplot(2,1,1)
semilogx((w1), 20*log10(abs(Tmatrix)),'LineWidth',2)

xlabel('$\omega$ (rad/s)')
ylabel('Magnitude (dB)')
legend('\alpha=0.1','\alpha=0.2','\alpha=0.4','\alpha=0.8');
title('Band-pass Filter');

subplot(2,1,2)
semilogx(w1, angle(Tmatrix),'LineWidth',2)
xlabel('$\omega$ (rad/s)')
ylabel('Phase')
legend('\alpha=0.1','\alpha=0.2','\alpha=0.4','\alpha=0.8');


