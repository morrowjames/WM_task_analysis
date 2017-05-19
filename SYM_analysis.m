addpath = ('\\ad.monash.edu\home\User077\morrowj\Desktop\Andrea_data');
clc; clear; clear all;
ID = {'Sub_01';};

for i = 1:size(ID,1)
    subject = [ID{i,1},'_SYM.xlsx'];
    b = importdata(subject); % import .xlsx file
end;

w = b.textdata(:,25); % remove irrelevant data fields and keep column 25
w = w(~cellfun('isempty',w)); % if any cells are empty remove them
w(1,:)=[]; % remove first cell as its a header and isnt needed

s = 'success';

tf = strcmp(w,s); % true/false. If cell = 'succes', print '1', else '0'.

totalSYM_Corr = sum(tf(:,1))/81*100;

for i = 1:2
a(i,1) = 1
end

for i = 3:4
    a(i,1) = 2
end

