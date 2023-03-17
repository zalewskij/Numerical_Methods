function [X,Y] = solveODE(x0, y0, h, f, xlim)
    %INPUT 
    %x0 - initial x
    %y0 - vector 2x1 - initial values of function
    %h - step
    %f - vector function [y1', y2']^T
    %xlim - bound for aproximations


    %x0, y0
    X = x0:h:xlim;
    Y = zeros(2,length(X));
    Y(1:2,1) = y0;
    
    %heun method - x1,y1
    k1 = f(x0,y0); %y0 [y0, z0]
    k2 = f(x0+h, y0+k1*h); 
    Y(1:2,2) = y0 + (k1+k2)*h/2;

    %midpoint rule - x2,y2, x3,y3, ...
    for k = 2:length(X)-1
        Y(1:2,k+1) = Y(1:2,k-1) + 2*h*f(X(k), Y(1:2,k));
    end
end