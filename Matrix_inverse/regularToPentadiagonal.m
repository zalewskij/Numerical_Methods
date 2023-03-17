function [B] = regularToPentadiagonal(A)
    %brief: Function transforms regular n x n pentadiagonal matrix to the form of matrix of size 5 x n
    
    %input: A - matrix of size n x n 
    % (when non-petadiagonal matrix is given, non-5-diagonal elements will be skipped and filled with 0)
        %  a(1) b(1) c(1)  0    ...   0      %
        %  d(2) a(2) b(2) c(2)  ...   0      %
        %  e(3) d(3) a(3) b(3)  ...   0      %
        %   0   e(4) d(4) a(4)  ... c(n-2)   %
        %  ...  ...  ...  ...   ... b(n-1)   %
        %   0    0    0   e(n) d(n)  a(n)    %

    %output: B - representation of array A in form of 5 x n matrix
        % a(1) a(2) a(3) a(4) ... a(n-2) a(n-1) a(n)
        % b(1) b(2) b(3) b(4) ... b(n-2) b(n-1) NaN
        % c(1) c(2) c(3) c(4) ... c(n-2) NaN    NaN
        % NaN d(2) d(3) d(4) ... d(n-2)  d(n-1) d(n)
        % NaN NaN e(3) e(4) ...  e(n-2)  e(n-1) e(n)

    n = max(size(A));
    B = NaN(5,n);
   
    for i = 1:(n-2)
        B(3,i) = A(i,i+2); %c
        B(5,i+2) = A(i+2, i); %e
    end
    
    for i = 1:(n-1)
        B(2,i) = A(i,i+1); %b
        B(4,i+1) = A(i+1, i); %d
    end

    for i =1:n
        B(1,i) = A(i,i); %a
    end
end





