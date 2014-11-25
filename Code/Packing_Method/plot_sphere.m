function [] = plot_sphere(X)
 %   x = X'; x = x(:);
    n = size(X,1);
    p = 3;
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
end