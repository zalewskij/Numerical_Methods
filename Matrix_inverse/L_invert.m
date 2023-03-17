function [L_inverse] = L_invert(L)
    %brief: Function to find inverse of lower triangular matrix

    %input: Lower triangular matrix L (3xn)
        %  1    1    1     1  ...    1     1     1   =>  a diagonal
        % NaN b(2) b(3) b(4) ... b(n-2) b(n-1) NaN   =>  d diagonal
        % NaN NaN c(3) c(4) ... c(n-2) NaN     NaN   =>  e diagonal
    
    %output: L_inverse n x n matrix which is inverse of L
    
    n = max(size(L));
    L_inverse = zeros(n,n);
    for i = 1:n
        L_inverse(i,i) = 1/L(1,i);
    end
    
    for i = 2:n
        L_inverse(i,i-1) = -L(2,i)/(L(1,i-1)*L(1,i));
    end
    
    for i = 2:(n-1)
        for j = (i+1):n
            L_inverse(j,j-i) = (-L(2,j)*L_inverse(j-1,j-i)-L(3,j)*L_inverse(j-2,j-i))/L(1,j);
        end
    end
end