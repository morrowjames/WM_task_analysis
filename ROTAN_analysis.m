%ROTAN_analysis
addpath = ('\\ad.monash.edu\home\User046\azdr0001\Desktop\WM_DATA\rotational span');

ID = {'Sub_01';};

for i = 1:size(ID,1)
    subject = [ID{i,1},'_ROTAN.xlsx'];
    b = importdata(subject); % import .xlsx file
end;

w = b.textdata(:,38); % remove irrelevant data fields and keep column 25
w = w(~cellfun('isempty',w)); % if any cells are empty remove them
w(1,:)=[]; % remove first cell as its a header and isnt needed

s = 'success';

tf = strcmp(w,s); % true/false. If cell = 'succes', print '1', else '0'.


