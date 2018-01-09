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
  
%         for k=1:numRaws
%             wave3=  M(k,2:end);
%             entropy3 = wentropy(wave3,entropyType);%%calculate Entropy Between 3 waves
%             entropy=entropy1+entropy2+entropy3;%
%             EntropyBetween3waves(i,j,k)=entropy;
%         end
    end
end
SubEntropy=[];
arrMin=[];
arrMin2=[];
arrMax=[];
for i=1:numRaws
    e1=EntropyBetween2waves(i,i);
    for j=1:numRaws
        if i>j
              e2=EntropyBetween2waves(i,j);
              SubEntropy(j,i)=abs(abs(e1)-abs(e2));
        end
    end
end
for i=1:numRaws
     k=1;    
     flag=0;
     arr=SubEntropy(:,i)
      while k<numRaws && flag==0
          
            valMin=min(arr)
            if valMin~=10000
                t='yes'
              
    %             valMax=max(arr)
                 indexMin=find(arr==valMin);
    %             indexMax=find(arr==valMax)

    %             arrMin(i)=indexMin;

                 arrMin2(i,k)=indexMin;
    %             arrMax(k,i)=find(arr==valMax);
                
                arr(indexMin)=10000;
                k=k+1
                
            
            else
                flag=1;
        end
 end  
 end
%     arr;
%     k=1;
%     
%     flag=0
%     if length(arr)>0
%         while k<numRaws & flag==0
%             t=arr
%             valMin=min(arr)
%             if valMin~=10000
%               
%     %             valMax=max(arr)
%                  indexMin=find(arr==valMin)
%     %             indexMax=find(arr==valMax)
% 
%     %             arrMin(i)=indexMin;
% 
%                  arrMin2(i,k)=indexMin;
%     %             arrMax(k,i)=find(arr==valMax);
%                 
%                 arr(indexMin)=10000;
%                 k=k+1
%                 
%             
%             else
%                 flag=1;
%         end
%         end
%     end
        

            
      
    


  