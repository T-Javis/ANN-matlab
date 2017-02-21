
%clear all;
%
%num=xlsread('ann.xlsx','Sheet1','A2:E15433');

data1=xlsread('ann.xlsx','Sheet1');

data2=data1(2:size(data1),:);
%[status,message]=xlswrite('new.xlsx',t,'Sheet1','A1:E10');

input_train=data2(1:10500,2:4)';
output_train=data2(1:10500,5)';

[inputn,inputps]=mapminmax(input_train);
[outputn,outputps]=mapminmax(output_train);


%input_test=data2(16001:size(data2),2:4)';
input_test=data2(10500:12000,2:4)';

%output_test=data2(12001:size(data2),5)';
%}
%
net=newff(input_train,output_train,[4,4,4],{'tansig','tansig','tansig'});
net.trainParam.epochs=10000;
net.trainParam.lr=0.001;
net.trainParam.goal=0.0001;
net.trainParam.show=100;
net.trainParam.max_fail=10;

[net,tr]=train(net,inputn,outputn);

inputn_test=mapminmax('apply',input_test,inputps);
ann=sim(net,inputn_test);
BPoutput=mapminmax('reverse',ann,outputps);
%}
%save data net inputps outputps

%{
an=sim(net,input_test);

BPoutput=mapminmax('reverse',an,outputps);
figure(1);
plot(BPoutput);
grid on;


an_d=sort(an,'descend');

plot(an);
grid on;
%}
%save('E:\project\ANN\a3.mat', 'net')

