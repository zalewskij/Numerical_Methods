

%Time measurments and norm calculation
for x = 1000:1000:10000
    
    disp("Sample for n =")
    disp(x)
    A = randi([1,100],x,x);
    B = regularToPentadiagonal(A);
    A = pentadiagonalToRegular(B);
    tic;
    [Ld, Ud] = Doolitle(B);
    inv_L = L_invert(Ld);
    inv_U = U_invert(Ud);
    %disp("U^-1 * L^-1");
    A_inv = inv_U*inv_L;
    toc    
    tic;
    inv(A);
    toc

    %norm calculation is getting really slow for larger matricies
    
    %uncomment for norm values 
    %disp("Norm: ")
    %disp(norm(A*A_inv - eye(x)))
end














