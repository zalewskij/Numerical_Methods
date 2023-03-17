function [A] = pentadiagonalToRegular(B)
    %brief: Function transforms pentadiadiagonal matrix of the form 5 x n to regular matrix of size n x n
      
    %input: B - representation of array A in form of 5 x n matrix
        % a(1) a(2) a(3) a(4) ... a(n-2) a(n-1) a(n)
        % b(1) b(2) b(3) b(4) ... b(n-2) b(n-1) NaN
        % c(1) c(2) c(3) c(4) ... c(n-2) NaN    NaN
        % NaN d(2) d(3) d(4) ... d(n-2)  d(n-1) d(n)
        % NaN NaN e(3) e(4) ...  e(n-2)  e(n-1) e(n)

     %output: A - matrix of size n x n         
        %  a(1) b(1) c(1)  0    ...   0      %
        %  d(2) a(2) b(2) c(2)  ...   0      %
        %  e(3) d(3) a(3) b(3)  ...   0      %
        %   0   e(4) d(4) a(4)  ... c(n-2)   %
        %  ...  ...  ...  ...   ... b(n-1)   %
        %   0    0    0   e(n) d(n)  a(n)    %

    n = max(size(B));
    A = zeros(n,n);

    for i = 1:(n-2)
        A(i,i+2) = B(3,i); %c
        A(i+2, i) = B(5,i+2); %e
    end
    
    for i = 1:(n-1)
        A(i,i+1) = B(2,i); %b
        A(i+1, i) = B(4,i+1); %d
    end

    for i =1:n
        A(i,i) = B(1,i); %a
    end
end





