addpath = ('\\ad.monash.edu\home\User077\morrowj\Desktop\Andrea_data');
clc; clear;
ID = {'Sub_01';};

for i = 1:size(ID,1)
    subject = [ID{i,1},'_SYM.xlsx'];
    b = importdata(subject); % import .xlsx file
end;

w = b.textdata(:,25); % remove irrelevant data fields and keep column 25
% w = w(~cellfun('isempty',w)); % if any cells are empty remove them
w(1,:)=[]; % remove first cell as its a header and isnt needed

s = 'success';

tf = strcmp(w,s); % true/false. If cell = 'succes', print '1', else '0'.

totalSYM_Corr = sum(tf(:,1))/81*100;

l = b.data(:,18); % keep column 18
z = b.data(:,18);

for i = 1:2
    l(i,1) = 1;
end;

for i = 4:5
    l(i,1) = 2;
end;

for i = 7:8
    l(i,1) = 3;
end;

for i = 10:12
    l(i,1) = 4;
end;

for i = 14:16
    l(i,1) = 5;
end;

for i = 18:20
    l(i,1) = 6;
end;

for i = 22:25
    l(i,1) = 7;
end;

for i = 27:30
    l(i,1) = 8;
end;

for i = 32:35
    l(i,1) = 9;
end;

for i = 37:41
    l(i,1) = 10;
end;

for i = 43:47
    l(i,1) = 11;
end;

for i = 49:53
    l(i,1) = 12;
end;

for i = 55:60
    l(i,1) = 13;
end;

for i = 62:67
    l(i,1) = 14;
end;

for i = 69:75
    l(i,1) = 15;
end;

for i = 77:83
    l(i,1) = 16;
end;

for i = 85:91
    l(i,1) = 17;
end;

for i = 93:99
    l(i,1) = 18;
end;

for idx = 1:18
    logA = l(:,1) == idx; %extract trial of interest
    rowInt = z(:,1);
    outputA = rowInt(logA);
    
    logOutput = outputA == 1;
    answer(idx,1) = sum(logOutput)./length(logOutput);
    %totalPCU_SSTM = sum(answer)./30*100;
end
