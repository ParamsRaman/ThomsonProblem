%% Main for SGD method

n = 10;
p = 3;

X = 2*rand(n, p)-1;
for i = 1:n
    X(i,:) = X(i,:)/norm(X(i,:));
end

lambda = 100;

% SGD algorithm
stepsize = 10^-6;
indx_i = 0;
indx_l = 0;

tic
for iter = 1:10^6
    indx_i = round(rand(1)*(n-1))+1;
    indx_l = round(rand(1)*(n-1))+1;
    if indx_i == indx_l
        continue
    end

    % Stochastic gradient update
    X(indx_i,:) = X(indx_i,:) - (stepsize .* calculate_grad_x(X, n, p, lambda, indx_i, indx_l));
    X(indx_l,:) = X(indx_l,:) - (stepsize .* calculate_grad_x(X, n, p, lambda, indx_i, indx_l));

    % Monitor objective function
    %fprintf('obj: %f\n', calculate_obj(X, n, p, lambda));
    fprintf('%f\n', calculate_obj(X, n, p, lambda));
end
toc

x = X; x = x(:);

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

