%Jacek Zalewski 313138
n_frames = 5000; %number of frames
v_range = 0.025; %max vx, vy, vz velocity
p_range = 1;     %max x, y, z coordinate
n = 30;          %number particles of blue/red color

%red and blue particle positions (x,y,z) and velocities (vx, vy, vz)
position_r = rand(n,3)*p_range; 
velocity_r = rand(n,3)*v_range; 
position_b = rand(n,3)*p_range;
velocity_b = rand(n,3)*v_range;

%initialize plot
r = animatedline('Marker', ".", "LineStyle", "none", "Color", "red");
b = animatedline('Marker', ".", "LineStyle", "none", "Color", "blue");
axis([0 1 0 1 0 1]);
grid("on");
view(3);

%animation loop
for k = 1:n_frames
    %clear previous frame
    clearpoints(r);
    clearpoints(b);
    
    %add new points
    addpoints(r, position_r(:,1), position_r(:,2), position_r(:,3));
    addpoints(b, position_b(:,1), position_b(:,2), position_b(:,3));
    
    %wall collision => change velocity direction
    velocity_r(position_r<0 | position_r>1) = -velocity_r(position_r>1 | position_r<0);
    velocity_b(position_b<0 | position_b>1) = -velocity_b(position_b>1 | position_b<0);
    
    %update position
    position_r = position_r + velocity_r;
    position_b = position_b + velocity_b;
    pause(0.01);
end
