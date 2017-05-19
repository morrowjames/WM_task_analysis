% Copywrite James Morrow & Andrea Zdral 2017
% To be used with SSTM_analysis.m.....
% Participant files are to be labelled ID_TASK ie: Sub_01_SSTM.txt
clear; close all; clc;
addpath = ('\\ad.monash.edu\home\User077\morrowj\Desktop\Andrea_data\');
pathout = ('\\ad.monash.edu\home\User077\morrowj\Desktop\Andrea_data\');

ID = {'003';'004';};

for i = 1:size(ID,1)
    
    SSTM_analysis
    ArrowWM_analysis
    
    output = struct('total_SSTM_ARROW',{totalCorr_SSTM,totalANU_SSTM,totalPCU_SSTM,totalANL_SSTM,ANL_ARROW,ANU_ARROW,PCL_ARROW,PCU_ARROW});

    save([pathout,ID{i,1},'_output.mat'],'output');
    
end

% save([pathout,ID{i,1},filesep,ID{i,1},'output.mat'],'output');

% totalCorr_SSTM,totalANU_SSTM,totalPCU_SSTM,totalANL_SSTM
