%% Main for Spherical method

n = 10;

phi = 2*pi*rand(1,n);
theta = pi*rand(1,n);

tic
out = lbfgs(@(x) spherical_obj(x, n), [phi theta]', 'MaxIters', 500, 'MaxFuncEvals', 500, 'StopTol', 1e-10);
toc

p = out.X;
%out.ExitFlag

figure()
[sx, sy, sz] = sphere(50);
lightGrey = 0.8*[1 1 1];
surf(sx, sy, sz, 'FaceColor', 'none','EdgeColor',lightGrey);
hold on
for i = 1:n
    x = sin(p(i))*cos(p(i+n));
    y = sin(p(i))*sin(p(i+n));
    z = cos(p(i));
    plot3(x, y, z, 'o', 'MarkerFaceColor', 'r', 'MarkerSize', 10);
    hold on;
end
