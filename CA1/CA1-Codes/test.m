t=0:0.01:1;
z1=sin(2*pi*sin(2*pi*t));

figure;
plot(sin(2*pi*t), z1)
title('in: x, out: y');
xlabel('x')
ylabel('y')
grid on