%addpath = ('\\ad.monash.edu\home\User077\morrowj\Desktop\Andrea_data');
addpath = ('\\ad.monash.edu\home\User046\azdr0001\Desktop\WM_DATA\symmetryspan');
clc; clear;
ID = {'01';};

for i = 1:size(ID,1)
    subject = [ID{i,1},'_SYM.xlsx'];
    b = importdata(subject); % import .xlsx file
end;

% Import SYM data from xls file
[~, ~, SYM] = xlsread('\\ad.monash.edu\home\User046\azdr0001\Desktop\WM_DATA\symmetryspan\01_SYM.xlsx','00001justincase','A2:AM100');
SYM(cellfun(@(x) ~isempty(x) && isnumeric(x) && isnan(x),SYM)) = {''};

% Create a loop that counts the number of successes for each trial
% SYM is the output from symmetry task
for symLength = 1:size(SYM,1) % Loop over the cell structure rows
    if ~isempty(SYM{symLength,39}) % Check if cell is empty. If not empty, proceed.
        trialSuccess = []; % Create an empty vector called trialSuccess
        for trialNum = 1:SYM{symLength,30} % Create a loop for the number of catch trials per trial
            if strcmp('success',SYM{symLength-trialNum,25}) % Check if catch trial was a success
                trialSuccess(trialNum,1) = 1; % If yes, code a 1
            else
                trialSuccess(trialNum,1) = 0; % If no, code a 0
            end
        end
        output(SYM{symLength,39},1) = sum(trialSuccess)./size(trialSuccess,1); % Calculate the ratio of correct to incorrect catch trials for each trial
    end
end

% for idx = 1:18
%     logA = l(:,1) == idx; %extract trial of interest
%     rowInt = z(:,1);
%     outputA = rowInt(logA);
%     
%     logOutput = outputA == 1;
%     answer(idx,1) = sum(logOutput)./length(logOutput);
%     %totalPCU_SSTM = sum(answer)./30*100;
% end
