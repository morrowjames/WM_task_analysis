%Arrow task
% Analaysis of SSTM working memory task
% Copywrite James Morrow & Andrea Zdral 2017

pathout = '\\ad.monash.edu\home\User077\morrowj\Desktop\Andrea_data\';

ID = {'001';};

for i = 1:size(ID,1)
    subject = [ID{i,1},'_ARROW.xlsx'];
    b = importdata(subject); % import .xlsx file
end;

w = b.textdata(:,26); % remove irrelevant data fields and keep column 25
%w = w(~cellfun('isempty',w)); % if any cells are empty remove them
w(1,:)=[]; % remove first cell as its a header and isnt needed

s = 'success';

tf = strcmp(w,s); % true/false. If cell = 'succes', print '1', else '0'.

totalCorr_ARROW = sum(tf(:,1)==1);