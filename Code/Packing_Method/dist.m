%% Function that returns all pair-wise distances b/w points
%% as matrix D
function [D] = dist(X)
    N = size(X,1);
    D = zeros(N,N);
    for i=1:N
        for j=i+1:N
            D(i,j) = norm(X(i,:)-X(j,:));
            D(j,i) = norm(X(i,:)-X(j,:));
            %fprintf('dist: %d and %d = %f \n', i, j, D(i,j))
        end
    end
end