% convert text data(of eeg) to csv file
data = importdata('EEG_Data.txt');
csvwrite('dataInCsv.csv', data)


%convert csv file to matrix
filename = 'dataInCsv.csv';
M = csvread(filename);%convert csv file to matrix

% L=length(M)
Electrodes=M(:,1);%(to get the first column)all the Electrodes
numRaws=length(Electrodes);
e1=M(1,:);
numColumn=length(e1);
Entropy1wave=[];
EntropyBetween2waves=[];
EntropyBetween3waves=[];


entropyType='shannon';
%calculate entropy 
for i=1:numRaws
    wave1=  M(i,2:end);%one wave
    entropy1 = wentropy(wave1,entropyType);%%calculate entropy for one wave 
    Entropy1wave(i)=entropy1;
    for j=1:numRaws
        wave2=  M(j,2:end);
        entropy2 = wentropy(wave2,entropyType);%%calculate  Entropy Between 2 waves 
        entropy=entropy1+entropy2;%
        EntropyBetween2waves(i,j)=entropy;
  
        for k=1:numRaws
            wave3=  M(k,2:end);
            entropy3 = wentropy(wave3,entropyType);%%calculate Entropy Between 3 waves
            entropy=entropy1+entropy2+entropy3;%
            EntropyBetween3waves(i,j,k)=entropy;
        end
    end
end

        

            
      
    


  