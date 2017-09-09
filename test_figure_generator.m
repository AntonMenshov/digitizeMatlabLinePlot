%test plot
close all;

%test data
x1=1:10;
y1=x1.*2;
x2=1:100;
y2=x2.*1.1;
x3=30;
y3=80;

%plotting figure 1: lines have different #points
figure(1)
plot(x1,y1,'-x');hold on;
plot(x2,y2,'-o');hold on;
plot(x3,y3,'-^');hold on;
legend('a','b','c');
grid on;
xlabel('a');
ylabel('b');
title('test');
savefig('mytestfigure_differentNum.fig');

%plotting figure 2: lines have the same #points
figure(2)
plot(x1,y1,'-x');hold on;
plot(x1,y1.*2,'-o');hold on;
plot(x1,y1.*3,'-^');hold on;
legend('a','b','c');
grid on;
xlabel('a');
ylabel('b');
title('test');
savefig('mytestfigure_sameNum.fig');

close all;