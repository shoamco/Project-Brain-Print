load relatedsig.mat

T =  0:0.001:(10*pi);
wave1=sin(T);
wave2=sin(2*T);
wave3=cos(2*T);
wave4=cos(T)+5;
wave5=sin(T)+5;
wave6=cos(T);
wave7=sin(T+5);

%plot wave
 ax(1) = subplot(7,1,1);
     plot(T,wave1,'k');
     title('sin(T)'); grid on
      ax(2) = subplot(7,1,2);
       plot(T,wave2,'k'); grid on
      ax(3) = subplot(7,1,3);
     plot(T,wave3,'k');grid on
      ax(4) = subplot(7,1,4);
       plot(T,wave4,'k');grid on
      ax(5) = subplot(7,1,5);
       plot(T,wave5,'k');grid on
      ax(6) = subplot(7,1,6);
       plot(T,wave6,'k');grid on
      ax(7) = subplot(7,1,7);
       plot(T,wave7,'k');grid on
 axis([0 10*pi -1.5 1.5]) 
%Cross-correlation


[C11,lag11] = xcorr(wave1,wave1); 
[C12,lag12] = xcorr(wave1,wave2);
[C13,lag13] = xcorr(wave1,wave3); 
[C14,lag14] = xcorr(wave1,wave4); 
[C15,lag15] = xcorr(wave1,wave5);        
[C16,lag16] = xcorr(wave1,wave6); 
[C17,lag17] = xcorr(wave1,wave7);

figure
ax(1) = subplot(7,1,1); 
plot(lag11/Fs,C11,'k')

grid on
title('Cross-correlation between wave1  and wave1')

ax(2) = subplot(7,1,2); 
plot(lag12/Fs,C12,'r')
 
grid on
title('Cross-correlation between wave1  and wave2')
xlabel('Time(secs)') 
% axis(ax(2),[0 10*pi -700 700])

ax(3) = subplot(7,1,3); 
plot(lag13/Fs,C13,'r')

grid on
title('Cross-correlation between wave1  and wave3')
xlabel('Time(secs)') 
% axis(ax(3),[-1.5 1.5 -700 700 ])

ax(4) = subplot(7,1,4); 
plot(lag14/Fs,C14,'r')
 
grid on
title('Cross-correlation between wave1  and wave4')
xlabel('Time(secs)') 



ax(5) = subplot(7,1,5); 
plot(lag15/Fs,C15,'r')

grid on
title('Cross-correlation between wave1  and wave5')
xlabel('Time(secs)') 

ax(6) = subplot(7,1,6); 
plot(lag16/Fs,C16,'r')
 
grid on
title('Cross-correlation between wave1  and wave6')
xlabel('Time(secs)') 



ax(7) = subplot(7,1,7); 
plot(lag17/Fs,C17,'r')

grid on
title('Cross-correlation between wave1  and wave7')
xlabel('Time(secs)') 


% axis([-2*pi 2*pi -700 700 ])

