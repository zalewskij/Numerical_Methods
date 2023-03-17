%UNCOMMENT 'TEST X' TO TEST THE CODE
%testing functions 
% Y = [Y1, Y2] 
% Y' = [Y1', Y2'] = F(Y1,Y2)


% %TEST 1 - x^3, x^2
% %initial values
% x0 = 0;
% y_1_0 = 0;
% y_2_0 = 0;
% xlim = 20;
% h = 1/4;
% %y1 = x^2 + 1 => y' = 2x
% %y2 = x^3 => y' = 3x^2
% F = @(x,Y) [2*x; 3*x*x]


%TEST 2 exponential and polynomial
%initial values
x0 = 0;
y_1_0 = 1;
y_2_0 = 0;
xlim = 20;
h = 1/100;
%y1' = y1 => y(x) = e^(x)
%y2' = 10000000 => y(x) = 10000000x
F = @(x,Y) [Y(1); 10000000];


% %TEST 3 dependence from another function
% %initial values
% x0 = 0;
% y_1_0 = -0.01;
% y_2_0 = 0.001;
% xlim = 20;
% h = 1/4;
% % y1' = y2 + y1 * (0.5 - y1^2 - y2^2)
% % y2' = -y1 +y2 * (0.5 - y1*y1-y2*y2)
% F = @(x,Y) [Y(2)+Y(1)*(0.5-Y(1)*Y(1)-Y(2)*Y(2)); -Y(1)+Y(2)*(0.5-Y(1)*Y(1)-Y(2)*Y(2))];


%comparison
[x, y] = solveODE(x0, [y_1_0; y_2_0], h, F, xlim);
[xt,yt] = ode45(F, [x0,xlim], [y_1_0 y_2_0]);

%equivalence of solutions - plot
hold on
plot(x, y(1,:), 'g') %heun method y1 function
plot(x, y(2,:), 'r') %heun method y2 function

plot(xt,yt(:,1),'o', Color='#778899')
plot(xt,yt(:,2),'o', Color='#778899')
