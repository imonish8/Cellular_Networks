clc;
clear all;
N=1000000;     %No. of bits within which error bits are to be calculated
SNRdb=0:1:50;   %Given Data
SNR= 10.^(SNRdb/10);   %SNR In dB
BER= qfunc((SNR).^0.5); % Use of Q in BPSK
BERdb=10*log10(BER);    %Bit Error Rate In decible
BERdb_perbit=BERdb/N;    % Bit Error Rate per bit
plot(SNRdb,BERdb_perbit,'b');
xlabel('SNR in Decibel');
ylabel('BER in Decibel');
grid on;

