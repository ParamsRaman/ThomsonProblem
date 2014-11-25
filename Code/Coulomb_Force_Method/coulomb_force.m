%% Main for the Coulomb Force Method

n = 2;
p = 3;

X = 2*rand(n, p)-1;
for i = 1:n
    X(i,:) = X(i,:)/norm(X(i,:));
end

lambda = 0.1;
for k = 1:1000 % number of passes
    for i = 1:n
        for j = 1:n
            if j==i
                break;
            end
            diff = X(i,:)-X(j,:);
            X(i,:) = X(i,:) + lambda * diff / (norm(diff)^1);
            X(i,:) = X(i,:)/norm(X(i,:));
        end
    end
end

figure()
[sx, sy, sz] = sphere();
surf(sx, sy, sz);
alpha 0
hold on
for i = 1:n
    plot3(X(i,1), X(i,2), X(i,3), 'o', 'MarkerFaceColor', 'r', 'MarkerSize', 10);
    hold on;
end

obj = 0;
for i = 1:n
    for j = 1:(i-1)
        obj = obj + 1/sum((X(i,:)-X(j,:)).^2);                                                                                                             
    end
end
obj