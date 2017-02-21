
%
%{
load ('E:\project\ANN\test2.mat', 'net')
input_train=data2(1:12000,2:4)';
output_train=data2(1:12000,5)';
[inputn,inputps]=mapminmax(input_train);
[outputn,outputps]=mapminmax(output_train);
%}

load data net inputps outputps

data1=xlsread('ann.xlsx','Sheet1');
data2=data1(2:size(data1),:);
X=data2(12000:13598,2:4);



num1=X';
inputn_test=mapminmax('apply',num1,inputps);
ann=sim(net,inputn_test);
testoutput=mapminmax('reverse',ann,outputps);
%}
%{
figure(1);
plot(testoutput);
grid on;
figure(2);
plot(data2(23655:24655,5),'r');
grid on;
%}

result=testoutput';
%data2(:,9)=result;
data2(12000:13598,9)=result;

