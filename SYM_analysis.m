addpath = ('\\ad.monash.edu\home\User077\morrowj\Desktop\Andrea_data');

ID = {'Sub_01';};

for i = 1:size(ID,1)
    subject = [ID{i,1},'_SYM.xlsx'];
    b = importdata(subject);
end;

w = b.textdata(:,25);
w = w(~cellfun('isempty',w));
w(1,:)=[];

s = 'success';

tf = strcmp(w,s);
