
data2z=data2(12000:13598,:);
data3=sortrows(data2z,-9);
rk=1:size(data3);
data3(:,10)=rk';
data4=sortrows(data3,-6);
data4(:,8)=rk';
data5=sortrows(data4,-5);
data5(:,7)=rk';
%data5=sortrows(data5,-6);
%
p8=data5(:,7);
p9=data5(:,8);
p10=data5(:,10);

m=200;
n=10;
num98=0;
num108=0;
p98=abs(p9-p8);
p108=abs(p10-p8);

for i=1:m
    if p98(i,1)>=0 && p98(i,1)<n
        num98=num98+1;
    end
end

for i=1:m
    if p108(i,1)>=0 && p108(i,1)<n
        num108=num108+1;
    end
end


%
figure('name','p98');
title('p98')
plot(p98);
grid on;

figure('name','p108');
plot(p108);
grid on;

figure(3)
bar([num98,num108]);
grid on;


figure(4)
plot(p98(1:m,1),'b')
hold on;
grid on;
plot(p108(1:m),'r')

%}

%--------------
%
r98=0;
r108=0;
%data5=sortrows(data4,7);
r8=data5(1:m,1);
r9=data4(1:m,1);
r10=data3(1:m,1);
for x=1:m
    for y=1:m
        if r8(y,1)==r9(x,1)
            r98=r98+1;
        elseif r8(y,1)==r10(x,1)
            r108=r108+1;
        end
    end
end

ac98=r98/m;
ac108=r108/m;

%
figure(5)
bar([ac98,ac108]);
grid on;
%}


