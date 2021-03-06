load relatedsig.mat

T =  0:0.001:(10*pi);
wave1=sin(T);
wave2=sin(2*T);
wave3=cos(2*T);
wave4=cos(T)+5;
% wave5=sin(T)+5;
wave5=T;
wave6=cos(T);
wave7=sin(T+15);

allWaves=[wave1;wave2;wave3;wave4;wave5;wave6;wave7];

% plot wave
% for i=1:7
%   i
%   wave=allWaves(i,:);
%    ax(i) = subplot(7,1,i);
%    plot(T,wave,'k');
%    grid on;
%    
% end


%Cross-correlation
[C11,lag11] = xcorr(wave1,wave1); 
[C12,lag12] = xcorr(wave1,wave2);
[C13,lag13] = xcorr(wave1,wave3); 
[C14,lag14] = xcorr(wave1,wave4); 
[C15,lag15] = xcorr(wave1,wave5);        
[C16,lag16] = xcorr(wave1,wave6); 
[C17,lag17] = xcorr(wave1,wave7);

[~,max11] = max(abs(C11));
% lagDiff = lag11(max11)


[~,max12] = max(abs(C12));
[~,max13] = max(abs(C13));
[~,max14] = max(abs(C14));
[~,max15] = max(abs(C15));
[~,max16] = max(abs(C16));
[~,max17] = max(abs(C17));

lagDiff11 = abs(lag11(max11));
lagDiff12 =abs( lag11(max12));
lagDiff13 = abs(lag11(max13));
lagDiff14 = abs(lag11(max14));
lagDiff15 =abs( lag11(max15));
lagDiff16 = abs(lag11(max16));
lagDiff17 =abs( lag11(max17));

arr=[max11,max12,max13,max14,max15,max16,max17];
arr2=[lagDiff11,lagDiff12,lagDiff13,lagDiff14,lagDiff15,lagDiff16,lagDiff17];
[sortVal,sortIndex] = sort(arr2);
sortIndex







%plot the sort waves
figure('Name','sort waves' );
title('sort wave that similer to wave1');
for i=1:7
   numWave=sortIndex(i);
  wave=allWaves(numWave,:);
   ax(i) = subplot(7,1,i);
   plot(T,wave,'k');
   grid on;
   
end





%plot the Cross-correlation
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



