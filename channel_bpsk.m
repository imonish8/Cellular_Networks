clear;
clc;
close all;
N=10000000;
EbN0dB = -5:1:27;
data=randn(1,N)>=0;
bpskModulated = 2*data-1;
M=2;
Rm=log2(M);
Rc=1;
BER = zeros(1,length(EbN0dB));
index=1;
for k=EbN0dB,
  EbN0=10.^(k/10);
  noiseSigma=sqrt(1./(2*Rm*Rc*EbN0));
  noise=noiseSigma*randn(1,length(bpskModulated));
  received=bpskModulated + noise;
  %Threshold Detector estimatedBits=(received>=0);
  %Bit Error rate calculation BER(index)=sum(xor(data,estimatedBits))/length
  index=index+1;
endfor
%Plot commands follows plotHandle=plot(EbN0dB,log10(BER),'r--');
%set(plotHandle,'LineWidth',1.5);
title('SNR per bit (Eb/N0) vs BER Curve for BPSK Modulation Scheme');

