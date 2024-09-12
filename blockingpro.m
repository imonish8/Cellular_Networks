% calculation of number of users (sbc)
% Users per Cell = 38.4/0.04  = 960
% Cell radius r in Km
% Blocking probability Pb= 2%   
r= [0.5 0.7 0.9 1 1.2 1.5]
Ac = 6*(r.^2/sqrt(3));
disp(Ac);
Nc=906./Ac;
Nt= Nc*960;
plot(r,Nt);

title('Number of Users with 2% Pb');


