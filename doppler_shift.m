
clc;
clear all;
speed_miles=60; % Given Speed in miles per hour
speed_km=60*1.6; % conversion to km per hour
speed_meter_per_sec=speed_km*(5/18); % conversion to m/s
c=3*(10^8);       %speed of light in m/s
fd=(speed_meter_per_sec/c)*cos(pi/6)*(1850*10^6); % Doppler Shift frequency
display(fd);

