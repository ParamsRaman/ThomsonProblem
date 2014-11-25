%% Tammes problem

N = 4;
p = 3;

X = 2*rand(N, p)-1;
for i = 1:N
    X(i,:) = X(i,:)/norm(X(i,:));
end
x = X'; x = x(:);

tol = 0.001;
beta = 0.0001;

plot_sphere(X);


%while true
for iter=1:100
    D = dist(X);
    
    %Step a
    [nnvals, nnind] = sort(D,2)
    nn3vals = nnvals(:, 2:4);
    nn3ind = nnind(:, 2:4);
    for i=1:N
        norm1 = norm(X(i,:)-X(nn3ind(i,1),:));
        norm2 = norm(X(i,:)-X(nn3ind(i,2),:));
        norm3 = norm(X(i,:)-X(nn3ind(i,3),:));
        if norm1 <= tol && norm2 <= tol && norm3 <= tol
           continue
        end
        
        Z = (X(nn3ind(i,1),:) + X(nn3ind(i,2),:) + X(nn3ind(i,3),:))/3;
        X(1,:) = Z(:);
    end
    
    for i=1:N
        X(i,:) = X(i,:)/norm(X(i,:));
    end
    
    D = dist(X);
    
    %Step b
    mind = zeros(N,1);
    for i=1:N
        DI = D(i,:);
        mind(i,1) = min(DI([1:i-1, i+1:end]));
    end
    
    X
    mind
    if abs(max(mind)-min(mind)) > tol
        disp('all mind are not equal');
        [val, selind] = max(mind);
        selind;
        selind_nn3ind = nn3ind(selind,:);
        selind_nn3ind
        center = X(selind,:);
        size(center);
        pts = X(selind_nn3ind,:);
        
        size(pts);
        X(selind_nn3ind,1) = (beta*center) + (1-beta)*pts(1,:);
        X(selind_nn3ind,2) = (beta*center) + (1-beta)*pts(2,:);
        X(selind_nn3ind,3) = (beta*center) + (1-beta)*pts(3,:);
        X
    end
    
    for i=1:N
        X(i,:) = X(i,:)/norm(X(i,:));
    end
    %plot_sphere(X);
    %pause(5);
end

plot_sphere(X);
