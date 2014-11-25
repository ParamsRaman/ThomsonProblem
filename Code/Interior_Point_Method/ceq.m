function [result] = ceq(X)
%sum = 0;
%for i=1:size(X,1)
%    sum = sum+norm(X(i,:))^2
%end
%result = sum;

result = norm(diag(X*X')-ones(size(X,1),1))^2;
end