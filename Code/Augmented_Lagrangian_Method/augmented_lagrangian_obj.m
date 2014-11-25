%% Objective for Augmented Lagrangian method

function [obj, grad] = augmented_lagrangian_obj(x, N, p, lambda, mu)

X = reshape(x, N, p);

% Computes the objective function
obj = 0;
for i = 1:N
    for j = 1:(i-1)
        obj = obj + 1/sum((X(i,:)-X(j,:)).^2);                                                                                                             
    end
    obj = obj + lambda/2 * (sum(X(i,:).^2)-1).^2 + mu(i) * (sum(X(i,:).^2)-1);
end

% Compute the gradients

grad = zeros(N, p);
for i = 1:N
    for l = 1:N
        if l==i
            continue
        end
        grad(i,:) = grad(i,:) - 2 * (X(i,:)-X(l,:)) / ( sum((X(i,:)-X(l,:)).^2)^2 );
    end
    grad(i,:) = grad(i,:) + 2*lambda * (sum(X(i,:).^2)-1) * X(i,:) + 2*mu(i) * sum(X(i,:));
end

grad = grad(:);

end
