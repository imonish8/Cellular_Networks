clc;
close all;
clear all;

% Boltzman Constant K = -228dBW/K/hz
% Satellite at 40,000Km distance from Earth station
% Satellite Antenna Gain = 31dB
% Receiver System Noise Temp = 500K
% Transponder saturated output Power = 80W
% Earth Station Antenna Diameter = 5m
% Earth Station Aperture Efficiency = 68%
% Uplink Frequency = 14.15Ghz
% Required C/N in transponder = 30dB
% Transponder HPA Output Backoff = 1 dB
% Location: -2dB contour of satellite receiving antenna
% Downlink Frequency = 11.45Ghz
% Receiver IF Noise BW = 43.2Mhz
% Antenna Noise Temp = 30K
% LNA Noise Temp = 110K
% Required Overall (C/N)o in clear air = 17dB



CNup=30:1:60;    %C/N required at transponder is 30dB
ln=length(CNup);
% Uplink Noise Power Budget
k=-228.6;  % Boltzman Constant
T1=500;
Ts1=10*log10(T1);     % noise temp 500K in dBK
B1=10*log10(43.2*10^6);;    % noise BW 43.2 Mhz in dBhz 

N1=k+Ts1+B1;  %in dBW   % Transponder Noise power N=kTsB
Pr1=N1+CNup;   % received power must be 30dB graeter than noise power
% Uplink Power Budget
R=4*10^7;
D=5;       % Antenna Diameter
Ae=0.68;   % Aperture Efficiency
lmb=0.0212; % operating wavelength
Gt1=10*log10(Ae*(pi*D/lmb)^2);  % Earth Satation Antenna gain
Lp1=10*log10((4*pi*R/lmb)^2);   % pathlosss in dB
Gr1=31;     % Satellite Antenna Gain in dB
Lp1=-Lp1;    % pathloss is negative
Lant=-2;    % due to 2dB contour
% Pr=Pt+Gt+Gr+Lp+Lant; As all in dB so simply addition
Pt1=Pr1-(Gt1+Gr1+Lp1+Lant);
for i=1:ln
Ptw(i)=10^(Pt1(i)/10);
end
subplot(2,1,1);
plot(CNup,Ptw,'LineWidth',1.5);
xlabel('C/N ratio in dB---->');
ylabel('Transmitted Power Pt in Watt----->');
title('C/N Versus Pt');
grid on;

%DOWNLINK DESIGN
CNdwn=17.2:1:50; % C/N downlink is 17.2 dB as C/N air is 17dB
lnn=length(CNdwn);
%Downlink noise Power Budget
k=-228.6;
T2=30+110; % noise temp
Ts2=10*log10(T2); % Noise Temp in dB
B2=10*log10(43.2*10^6); % Noise BW in dB
N2=k+Ts2+B2;

Pr2=N2+CNdwn;  %power at earthstation receiver input
Lp2=207.2-20*log10(14.15/11.45);
Pt2=10*log10(80)-1; % Output power is 1dB below saturated power 80W
%Downlink Power Budget
Gt2=31;
Lp2=-Lp2;
La=-3;
% Pr=(Pt*Gt*Gr)/(Lp*La)  in Watt
% Pr=Pt+Gt+Gr-Lp-La      in dB
Gr2=Pr2-(Pt2+Gt2+Lp2+La);
for i=1:lnn
Grw(i)=10^(Gr2(i)/10);
end
subplot(2,1,2);
plot(CNdwn,Grw,'LineWidth',1.5);
xlabel('C/N ratio in dB---->');
ylabel('Receiving Antenna Gain Gr in Watt----->');
title('C/N Versus Gr');
grid on;

