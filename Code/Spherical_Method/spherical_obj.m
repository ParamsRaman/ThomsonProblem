%% Objective for Spherical Method

function [obj, grad] = spherical_obj(params, N)

phi = params(1:N);
theta = params((N+1):2*N);

% Computes the objective function
obj = 0;
for j = 1:N-1
    for i = (j+1):N
        obj = obj - 1/2/( sin(phi(i)).*sin(phi(j)).*cos(theta(i)-theta(j))...
            + cos(phi(i)).*cos(phi(j)) - 1 );                                                                                                                                   
    end 
end

% Compute the gradients
grad_phi = zeros(N,1);
grad_theta = zeros(N,1);

for i = 1:N
    for j = 1:N
        if i==j
            continue
        end
        grad_phi(i) = grad_phi(i) + ( cos(phi(i))*sin(phi(j))*cos(theta(i)-theta(j))...
                - sin(phi(i))*cos(phi(j)) )...
                /2/( sin(phi(i)).*sin(phi(j)).*cos(theta(i)-theta(j))...
                + cos(phi(i)).*cos(phi(j)) - 1 ).^2;
    end
        
%     for j = 1:(i-1)
%         grad_phi(i) = grad_phi(i) + ( cos(phi(i))*sin(phi(j))*cos(theta(i)-theta(j))...
%             - sin(phi(i))*cos(phi(j)) )...
%             /2/( sin(phi(i)).*sin(phi(j)).*cos(theta(i)-theta(j))...
%             + cos(phi(i)).*cos(phi(j)) - 1 ).^2;
%     end
%     for j = (i+1):N
%         grad_phi(i) = grad_phi(i) + ( cos(phi(i))*sin(phi(j))*sin(theta(i)-theta(j))...
%             - sin(phi(i))*cos(phi(j)) )...
%             /2/( sin(phi(i)).*sin(phi(j)).*cos(theta(i)-theta(j))...
%             + cos(phi(i)).*cos(phi(j)) - 1 ).^2;
%     end
end

for i = 1:N
    for j = 1:N
        if i==j
            continue
        end
        grad_theta(i) = grad_theta(i) - sin(phi(i))*sin(phi(j))*sin(theta(i)-theta(j))...
            /2/( sin(phi(i)).*sin(phi(j)).*cos(theta(i)-theta(j))...
            + cos(phi(i)).*cos(phi(j)) - 1 ).^2;
    end
%     for j = 1:(i-1)
%         grad_theta(i) = grad_theta(i) - sin(phi(i))*sin(phi(j))*sin(theta(i)-theta(j))...
%             /2/( sin(phi(i)).*sin(phi(j)).*cos(theta(i)-theta(j))...
%             + cos(phi(i)).*cos(phi(j)) - 1 ).^2;
%     end
%     for j = (i+1):N
%         grad_theta(i) = grad_theta(i) - sin(phi(i))*sin(phi(j))*cos(theta(i)-theta(j))...
%             /2/( sin(phi(i)).*sin(phi(j)).*cos(theta(i)-theta(j))...
%             + cos(phi(i)).*cos(phi(j)) - 1 ).^2;
%     end
end

grad = [grad_phi; grad_theta];
