t=-1:0.01:1;
x2=cos(2*pi*t);
a2=5;
b2=-3;

noise=randn(size(t));
y2=a2*x2+b2+noise;
[alpha, beta]=p2_4(x2,y2);

fprintf("found alpha and beta are %d, %d", alpha, beta);