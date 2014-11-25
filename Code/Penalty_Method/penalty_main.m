%% Main for Penalty method

n = 10;
p = 3;

X = 2*rand(n, p)-1;
for i = 1:n
    X(i,:) = X(i,:)/norm(X(i,:));
end
x = X; x = x(:);

lambda = 0;

for k = 1:1000 % Gradually decreasing step-sizes
    lambda = lambda + 0.1;
    out = lbfgs(@(x) penalty_obj(x, n, p, lambda), x, 'MaxIters', 20000, 'MaxFuncEvals', 2000, 'StopTol', 2^(-5*k));
    x = out.X;
end

figure()
[sx, sy, sz] = sphere(50);
lightGrey = 0.8*[1 1 1];
surf(sx, sy, sz, 'FaceColor', 'none','EdgeColor',lightGrey);
hold on
P = reshape(x, n, p);
for i = 1:n
    plot3(P(i,1), P(i,2), P(i,3), 'o', 'MarkerFaceColor', 'r', 'MarkerSize', 10);
    hold on;
end
