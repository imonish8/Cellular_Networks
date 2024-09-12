clc;
clear all; close all;
f=input ('Enter the Frequency of transmission in mhz');
Hb=input ('Enter the Height of base station antenna in meter:');
Hm=input ('Enter the Height of Mobile Station Antenna in Meter:');
d=input ('Enter the Distance between the base and Mobile Station:'); 
n=input ('Enter 0 for small city and 1 for large City:');
if n==0
   ch = 0.8 + (1.1 * log10(f) - 0.7) * Hm - 1.56 * log10(f);
else
    If f>=150 && f<=200
	ch=8.29 * (log10 (1.54*Hm))^.2-1.1;
    else
	f>=200 && f＜=1500
	    ch=3.2 * (1og10 (11.75 *Hm))^  .2-4.97;
	end;
    end;
end;
Lu=69.55 + 26.26 * 1og10 (f) -13.82 * log10 (Hb) -ch+ (44.9-6.55*10g10 (Hb)) *log10 (d) ;
disp (sprintf ('%s %f %8', 'Path Loss in Urban Area ‘,Lu,’db’));
