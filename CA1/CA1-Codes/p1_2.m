t=0:0.01:1;
z1=sin(2*pi*t);
z2=cos(2*pi*t);

figure;
x0=[0.5;0.25];
y0=[0.2;-0.8];

sub1 = subplot(1,2,1);
plot(t,z1,'--b')
s1=['sin(2 \pi t)'];
text(0, 0, s1, 'Parent', sub1);

title('Sin'); %title
legend('sin')
xlabel('time')
ylabel('amplitude')
grid on

sub2 = subplot(1,2,2);
plot(t,z2,'r')
s2=['cos(2 \pi t)'];
text(0, 0, s2, 'Parent', sub2);

title('Cos'); %title
legend('cos')
xlabel('time')
ylabel('amplitude')
grid on
