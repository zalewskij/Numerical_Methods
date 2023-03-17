function [U_inv] = U_invert(U)
    %brief: Function to find inverse of upper triangular matrix

    %input:  Upper triangular matrix U (3xn)
        % a(1) a(2) a(3) a(4) ... a(n-2) a(n-1) a(n)
        % b(1) b(2) b(3) b(4) ... b(n-2) b(n-1) NaN
        % c(1) c(2) c(3) c(4) ... c(n-2) NaN    NaN
    
    %output: U_inverse n x n matrix which is inverse of U

    N = max(size(U));
    U_inv = zeros(N,N);
    for i = 1:N
        U_inv(i,i) = 1/U(1,i);
    end
    
    for i = 1:(N-1)
       U_inv(i,i+1) = -(U(2,i)*U_inv(i+1,i+1))/U(1,i);
    end
    
    for j = 2:(N-1)
        for i = 1:(N-j)           
            U_inv(i, i+j) = -(U(2,i)*U_inv(i+1,i+j) + U(3,i)*U_inv(i+2,i+j))/U(1,i);
        end
    end
end