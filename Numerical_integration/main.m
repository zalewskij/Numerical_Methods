%variables
a = 0; b = 1;
c = 0; d = 8;
n = 4;
hx = (b-a)/n;
hy = (d-c)/n;
[x,y] = meshgrid(a:hx:b,c:hy:d);

%TEST 1%
%integrand
f1 = sin(x.^2) + y.^2;
%numerical integral
I1 = trapezoidIntegral(a, b, c, d, n, f1);
%matlab numerical integrals
I1t = integral2(@(x,y) sin(x.^2) + y.^2,a,b,c,d);

%TEST 2%
%integrand
f2 = x.^3 - y.^2;
%numerical integral
I2 = trapezoidIntegral(a, b, c, d, n, f2);
%matlab numerical integrals
I2t = integral2(@(x,y) x.^3 - y.^2,a,b,c,d);

%TEST 3%
%changing integrating bounds
a = -5; b = 5;
c = -3; d = 3;
n = 100;
hx = (b-a)/n;
hy = (d-c)/n;
[x,y] = meshgrid(a:hx:b,c:hy:d);

%integrand
f3 = x.^7 - y.^2  + cos(x - y);
%numerical integral
I3 = trapezoidIntegral(a, b, c, d, n, f3);
%matlab numerical integrals
I3t = integral2(@(x,y) x.^7 - y.^2 + cos(x-y),a,b,c,d);


x = [1,2,3,4,5,10,100];
y = [259.36, 194.67, 182.57,178.52, 176.59, 174.009, 173.15];

plot(x,y);
hold on;
y2 = x*0+173.1488;
plot(x,y2, "--");
xlabel('n');
ylabel('approximated value');











