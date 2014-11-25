%% Main for the Interior-Point method

n = 40;
p = 3;

X = 2*rand(n, p)-1;
for i = 1:n
    X(i,:) = X(i,:)/norm(X(i,:));
end
x = X; x = x(:);

nonlinfcn = @(X)deal([],ceq(X));

tic
options = optimset('MaxIter', 500000, 'MaxFunEvals', 500000, 'GradObj', 'on', 'Algorithm', 'interior-point')
[out,fval] = fmincon(@(X) interior_point_obj(x,n,p), X, [],[],[],[],[],[],nonlinfcn,options)
toc

fval
%P = reshape(out, n, p);
P = out;
size(P)

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
