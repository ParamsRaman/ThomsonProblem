%% Main for Augmented Lagragian method

n = 40;
p = 3;

X = 2*rand(n, p)-1;
for i = 1:n
    X(i,:) = X(i,:)/norm(X(i,:));
end
x = X; x = x(:);

lambda = 1;
mu = zeros(n,1);

for k = 1:3000 % Gradually decreasing step-sizes
    lambda = lambda + 0.1;
    out = lbfgs(@(x) augmented_lagrangian_obj(x, n, p, lambda,  mu), x, 'MaxIters', 20000, 'MaxFuncEvals', 2000, 'StopTol', 2^(-sqrt(k)));
    x = out.X;
    mu = mu - lambda * (sum(X.^2, 2)-ones(n,1));
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

