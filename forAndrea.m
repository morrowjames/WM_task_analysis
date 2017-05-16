clear; close all; clc;
addpath = ('\\ad.monash.edu\home\User077\morrowj\Desktop\Andrea_data');

pathout = '\\ad.monash.edu\home\User077\morrowj\Desktop\Andrea_data\';

ID = {'Sub_04';}; %'Sub_03';'Sub-04';};

for i = 1:size(ID,1)

    subject = [ID{i,1},'_SSTM.txt'];
    a = dlmread(subject, '', 36, 0);
    totalCorr_SSTM = sum(a(:,8)==2)./120*100;
    
    for z = 1:30
        [x,y]=find([a(:,9)]==z);
    
        if a(x,8)==2
                corrAns(z) = 1;
        else 
                corrAns(z) = 0;
        end;
    
        totalANU_SSTM = sum(corrAns(1,:)==1)./30*100;
    
    end;
    
    for idx = 1:30;
        logA = a(:,9) == idx; %extract trial of interest
        rowInt = a(:,8);
        outputA = rowInt(logA);

        logOutput = outputA == 2;
        answer(idx,1) = sum(logOutput)./length(logOutput);
        totalPCU_SSTM = sum(answer)./30*100;
    end;
    
    for z = 1:30
        [x,y]=find([a(:,9)]==z);
    
        if a(x,8)==2
                Ans(z) = 1*length(x);
        else 
                Ans(z) = 0;
        end;
    
        totalANL_SSTM = sum(Ans)./120*100;
    
    end;
end;

output.(ID{1,1}) = struct('total_SSTM',{totalCorr_SSTM,totalANU_SSTM,totalPCU_SSTM,totalANL_SSTM});

save([pathout,ID{i,1},'_output_SSTM'],'output');
