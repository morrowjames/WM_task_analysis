%Arrow task
% Analaysis of SSTM working memory task
% Copywrite James Morrow & Andrea Zdral 2017
clear; clear all; clc
pathout = '\\ad.monash.edu\home\User046\azdr0001\Desktop\WM_DATA\arrow_span\';

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

totalCorr_ANU = sum(tf(:,1)==1)/18*100;

%% ##### ANL - 1 point per correct item, only for totally correct trials #####

g = b.data(:,18); % remove irrelevant data fields and keep column 18

outputA = g(tf);

totalANL_ARROW = sum(outputA)./81*100;

%% ##### PCL
h = b.textdata(:,25);    
n = b.textdata(:,24);
k = cell(1,length(n) -1);
for i = 1:length(k)
nn = n{i+1};
nn(nn=='[') = [];
nn(nn==']') = [];
nn(nn==',') = [];
k{i} = str2num(nn); 
pres_table = reshape(k{i},[],2);


% h = b.textdata(:,25);
% k = cell(1,length(h) -1);
% i = 1:length(k)
hh = h{i+1};
hh(hh=='[') = [];
hh(hh==']') = [];
hh(hh==',') = [];
k{i} = str2num(hh);
probe_table = reshape(k{i},[],2);

letssee = pres_table == probe_table;
checkA = letssee(:,1);
checkB= letssee(:,2);

variable(i) = sum(checkA(checkB));
end

grand_total = sum(variable(1,:))
totalPCL_ARROW = (grand_total/81)*100

%% ###### PCU 

    total_2(i) = sum(variable(i)/length(checkA))
    totalPCU_ARROW = total_2./18*100

