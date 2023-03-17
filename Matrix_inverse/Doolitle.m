function [Ld,Ud] = Doolitle(A)
    %brief: Function performs LU factorization of matrix A
        %Doolitle implementation based on
        %https://www.academia.edu/24859989/On_the_inverse_of_a_general_pentadiagonal_matrix
    
    %input: Matrix A in pentadiagonal 5xn form
        %  a(1) b(1) c(1)  0    ...   0      %
        %  d(2) a(2) b(2) c(2)  ...   0      %
        %  e(3) d(3) a(3) b(3)  ...   0      %
        %   0   e(4) d(4) a(4)  ... c(n-2)   %
        %  ...  ...  ...  ...   ... b(n-1)   %
        %   0    0    0   e(n) d(n)  a(n)    %

     %output: 
        % Ld - lower triangular 3 x n matrix
             %  1    1    1     1  ...    1     1     1   =>  a diagonal
             % NaN b(2) b(3) b(4) ... b(n-2) b(n-1) NaN   =>  d diagonal
             % NaN NaN c(3) c(4) ... c(n-2) NaN     NaN   =>  e diagonal
                
        % Ud -upper triangular 3 x n matrix
            % a(1) a(2) a(3) a(4) ... a(n-2) a(n-1) a(n)
            % b(1) b(2) b(3) b(4) ... b(n-2) b(n-1) NaN
            % c(1) c(2) c(3) c(4) ... c(n-2) NaN    NaN

        % values of a, b, c, d, e in A and in L and U are not the same 
        % This is only to show position in matricies

    %initializing needed vectors/matrices
    n = max(size(A));
    X = zeros(n,1);
    Y = zeros(n,1);
    Z = zeros(n,1);
    Ld = nan(3,n);
    Ud = nan(3,n);
    
    %step 1
    X(1) = A(1, 1); 
    Y(1) = A(2, 1);
    Z(2) = A(4,2)/X(1);
   
    %step 2
    X(2) = A(1,2) - Y(1)*Z(2);
    Y(2) = A(2,2) - Z(2)*A(3,1);
    Z(3) = (A(4,3)-(A(5,3)*Y(1))/X(1))/X(2); 
   
    %step 3 
    for i = 3:n-2
        X(i) = A(1,i) - Y(i-1)*Z(i) - A(5,i)*A(3,i-2)/X(i-2);
        Y(i) = A(2,i)-Z(i)*A(3,i-1);
        Z(i+1) = (A(4,i+1)-(A(5,i+1)*Y(i-1))/X(i-1))/X(i); 
    end
    
    %step 4
    X(n-1) = A(1, n-1) - Y(n-2)*Z(n-1) - A(5,n-1)*A(3, n-3)/X(n-3);
    Y(n-1) = A(2, n-1) - Z(n-1)*A(3,n-2);
    Z(n) = (A(4,n) - (A(5,n)*Y(n-2))/X(n-2))/X(n-1); 
    
    %step 5
    X(n) = A(1,n)-Y(n-1)*Z(n) - A(5,n)*A(3,n-2)/X(n-2);
    
    %Finding L and U
    
    %main diagonal
    for i=1:n
        Ld(1,i) = 1;
        Ud(1,i) = X(i);
    end
    
    %here it could be optimized(loop for common range and filling elements
    %out of range) But I'll leave it as it is more straighforward to
    %read

    for i=2:n 
        Ld(2,i) = Z(i);
    end

    for i = 3:n
        Ld(3,i) = A(5,i)/X(i-2);
    end

    for i=1:n-1
        Ud(2,i) = Y(i);
    end

    for i=1:n-2
        Ud(3,i) = A(3,i);
    end
end