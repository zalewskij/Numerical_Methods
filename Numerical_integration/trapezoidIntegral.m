function I = trapezoidIntegral(a, b, c, d, n, f)
    %INPUT%
    %a,b and c,d - integration intervals
    %n - number of breaks used to integrate (for each integral)
    %f - grid matrix of f(x,y) values
    %OUTPUT%
    %value of the double integral of f
    
    %calculate heights of trapezoids
    hx = (b-a)/n;
    hy = (d-c)/n;
    %change n to be number of trapezoids
    n = n+1;

    %calculate integral with use of trapezoids
    s1 = sum(sum(f(2:n-1, 2:n-1)));
    s2 = sum(f(1,2:n-1)) + sum(f(n,2:n-1));
    s3 = sum(f(2:n-1, 1)) + sum(f(2:n-1,n));
    I = (hx*hy)/4 * (f(1,1) + f(1,n) + f(n,1) + f(n,n) + 4*s1 + 2*s2 + 2*s3);
end