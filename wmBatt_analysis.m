% Copywrite James Morrow & Andrea Zdral 2017
% To be used with SSTM_analysis.m.....
% Participant files are to be labelled ID_TASK ie: Sub_01_SSTM.txt
clear; close all; clc;
addpath = ('\\ad.monash.edu\home\User077\morrowj\Desktop\Andrea_data');
ID = {'Sub_3';};

for i = 1:size(ID,1)
    
    SSTM_analysis
    ArrowWM_analysis
    
end
