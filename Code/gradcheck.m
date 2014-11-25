
% Gradient Check for spherical_main.m
% N = 2;
% phi = 2*pi*rand(1,N);
% theta = pi*rand(1,N);
% out = gradientcheck(@(x) spherical_obj(x, N), [phi theta]', 'DifferenceType','forward');
% out
% out.G
% out.GFD

% % Gradient Check for penalty_main.m
% N = 2;
% p = 3;
% X = 2*rand(N, p)-1;
% x = X; x = x(:);
% out = gradientcheck(@(x) penalty_obj(x, N, p, 1), x, 'DifferenceType', 'forward');
% out
% out.G
% out.GFD

% Gradient Check for interior_point_main.m
% N = 3;
% p = 3;
% X = 2*rand(N, p)-1;
% for i = 1:N
%     X(i,:) = X(i,:)/norm(X(i,:));
% end
% x = X; x = x(:);
% out = gradientcheck(@(x) interior_point_obj(x,N,p), x, 'DifferenceType', 'forward');
% out
% out.G
% out.GFD

% Gradient Check for augmented_lagrangian_main.m
% N = 3;
% p = 3;
% X = 2*rand(N, p)-1;
% for i = 1:N
%     X(i,:) = X(i,:)/norm(X(i,:));
% end
% x = X; x = x(:);
% lambda = 1;
% mu = zeros(N,1);
% out = gradientcheck(@(x) augmented_lagrangian_obj(x,N,p,lambda,mu), x, 'DifferenceType', 'forward');
% out
% out.G
% out.GFD

