

% Proof that low entropy does not produce similar waves

T = [0:0.0001:1000];
wave1=sin(T);
wave2=sin(2*T);
wave3=cos(2*T);
wave4=cos(T)+5;
wave5=sin(T)+5;

entropyType='shannon';

%Entropy on one wave
entropy1 = wentropy(wave1,entropyType);
entropy2 = wentropy(wave2,entropyType);
entropy3 = wentropy(wave3,entropyType);
entropy4 = wentropy(wave4,entropyType);
entropy5 = wentropy(wave5,entropyType);


%Entropy between 2 waves
entropy11=entropy1+entropy1;
entropy12=entropy1+entropy2;
entropy13=entropy1+entropy3;
entropy14=entropy1+entropy4;
entropy15=entropy1+entropy5;

%Subtraction of entropy
s11=abs(entropy11-entropy11);
s12=abs(entropy11-entropy12);
s13=abs(entropy11-entropy13);
s14=abs(entropy11-entropy14);
s15=abs(entropy11-entropy15);


ans=[s11,s12,s13,s14,s15];
[sortVal,sortIndex] = sort(ans,2);
sortIndex

%We got that the waves most similar to sin(T) are:
%sin(T)  ,cos(2*T) , sin(2*T)  ,sin(T)+5,  cos(T)+5
%Conclusion: Low entropy does not give similar waves
