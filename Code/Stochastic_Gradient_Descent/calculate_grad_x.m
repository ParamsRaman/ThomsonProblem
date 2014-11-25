%% Gradient wrt X

function [grad] = calculate_grad_x(X, n, p, lambda, i, l)

% Compute the gradients
grad = zeros(1, p);
grad(1,:) = grad(1,:) - 2 .* (X(i,:)-X(l,:)) / ( sum((X(i,:)-X(l,:)).^2)^2 );
grad(1,:) = grad(1,:) + lambda/(n-1) .* (sum(X(i,:).^2)-1) .* X(i,:);

end