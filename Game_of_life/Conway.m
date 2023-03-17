%initialize matrix
N = 50; %size of the board
A = zeros(N);
n_frames = 200; %number of frames in animation

%https://conwaylife.com/wiki/Lightweight_spaceship
LWSS = [0 0 0 0 0 0 0;
	    0 0 1 0 0 1 0;
	    0 1 0 0 0 0 0;
	    0 1 0 0 0 1 0;
	    0 1 1 1 1 0 0;
        0 0 0 0 0 0 0];

%place LWSS on board
A(N/2:N/2+5, N-6:N) = LWSS;

%initialize animation
f = imagesc(A);
pause(1);

%animation loop
for i=1:n_frames
    A = update(A);
    f.CData = A;
    pause(0.5);
end

function A = update(A)
    %S is a matrix representing number of living, neighbour cells
    S = conv2(A, [1 1 1; 1 0 1; 1 1 1], 'same');
    
    %cell lives if:
    %A==1 and (S==2 or S==3)
    %A==0 and          S==3)
    A = (A & (S==2)) | (S==3);
end

