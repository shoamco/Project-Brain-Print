



T =  0:0.001:(10*pi);
wave1=sin(T);
wave2=sin(2*T);
wave3=cos(2*T);
wave4=cos(T)+5;
wave5=sin(T)+5;
wave6=cos(T);
wave7=sin(T+5);
entropyType='shannon';



 ax(1) = subplot(7,1,1);
     plot(T,wave1,'k'); 
     ylabel('sin(T)')
     grid on
      ax(2) = subplot(7,1,2);
       plot(T,wave2,'k'); 
%        ylabel('sin(2*T)')
      grid on
      ax(3) = subplot(7,1,3);
     plot(T,wave3,'k'); 
%       ylabel('cos(2*T)')
      grid on
      ax(4) = subplot(7,1,4);
       plot(T,wave4,'k'); 
%       ylabel('cos(T)+5')
      grid on
      ax(5) = subplot(7,1,5);
       plot(T,wave5,'k'); 
%       ylabel('sin(T)+5')
      grid on
      ax(6) = subplot(7,1,6);
       plot(T,wave6,'k'); 
%       ylabel('cos(T))')
      grid on
      ax(7) = subplot(7,1,7);
       plot(T,wave7,'k'); 
%       ylabel('sin(T+5')
      grid on
 axis([0 10*pi -1.5 1.5]) 

%Entropy on one wave
entropy1 = wentropy(wave1,entropyType);
entropy2 = wentropy(wave2,entropyType);
entropy3 = wentropy(wave3,entropyType);
entropy4 = wentropy(wave4,entropyType);
entropy5 = wentropy(wave5,entropyType);
entropy6 = wentropy(wave6,entropyType);
entropy7 = wentropy(wave7,entropyType);

%Entropy between 2 waves
entropy11=entropy1+entropy1;
entropy12=entropy1+entropy2;
entropy13=entropy1+entropy3;
entropy14=entropy1+entropy4;
entropy15=entropy1+entropy5;
entropy16=entropy1+entropy6;
entropy17=entropy1+entropy7;

%Subtraction of entropy
s11=abs(entropy11-entropy11);
s12=abs(entropy11-entropy12);
s13=abs(entropy11-entropy13);
s14=abs(entropy11-entropy14);
s15=abs(entropy11-entropy15);
s16=abs(entropy11-entropy16);
s17=abs(entropy11-entropy17);


ans=[s11,s12,s13,s14,s15,s16,s17];
[sortVal,sortIndex] = sort(ans,2);
sortIndex

