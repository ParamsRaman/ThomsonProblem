%% Objective for SGD method

function [obj] = calculate_obj(x, N, p, lambda)

X = reshape(x, N, p);

% Computes the objective function
obj = 0;
for i = 1:N
    for j = 1:(i-1)
        obj = obj + 1/sum((X(i,:)-X(j,:)).^2);                                                                                                             
    end
    obj = obj + lambda/2 * (sum(X(i,:).^2)-1).^2;
end

end
