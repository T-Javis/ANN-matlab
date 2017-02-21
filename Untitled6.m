 P = [0 1 2 3 4 5 6 7 8 9 10];
 T = [0 1 2 3 4 3 2 1 2 3 4];
 net = newff(P,T,[15,10]);
 Y = sim(net,P);
 figure(1);
 plot(P,T,P,Y,'o')
 net.trainParam.epochs = 0;
 net = train(net,P,T);
 Y = sim(net,P);
 figure(2);
 plot(P,T,P,Y,'o')