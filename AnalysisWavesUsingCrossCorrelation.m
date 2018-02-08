% % convert text data(of eeg) to csv file
% data = importdata('EEG_Data.txt');
% csvwrite('dataInCsv.csv', data)



%convert csv file to matrix
filename = 'dataInCsv.csv';
M = csvread(filename);%convert csv file to matrix
T=M(1,2:end);%the times
allWaves=M(2:end,2:end);%remove column and first line


numOfWaves=length(allWaves(:,1));
e1=allWaves(1,:);
numColumn=length(e1);
CorrelationBetweenWaves=[];
lagWaves=[];
PeakCorrelation=[];
lagDiffCorrelation=[];


% plot waves
for i=1:numOfWaves

   wave=allWaves(i,:);
   ax(i) = subplot(numOfWaves,1,i);
   plot(T,wave,'k');
   grid on;
   
end

for i=1:numOfWaves
    wave1=  allWaves(i,:);%one wave
 
    for j=1:numOfWaves
        wave2=  allWaves(j,:);
        [r,lag] = xcorr(wave1,wave2); %%calculate Cross-correlation Between 2 waves
        CorrelationBetweenWaves(i,j,:)=r;
        lagWaves(i,j,:)=lag;
        [~,peak] = max(abs(r));
        lagDiff = abs(lag(peak));
        PeakCorrelation(i,j)=peak;
        lagDiffCorrelation(i,j)=lagDiff;
        
    end
end
        

%sort the waves 
[sortVal,sortIndex] = sort(lagDiffCorrelation,2);

sortIndex;

%save  matrixs in Excel files
xlswrite("Sort waves",sortIndex)
