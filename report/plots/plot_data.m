% Plot no of points vs time taken to find the solution
% data = csvread('times_a.csv')
% 
% figure
% plot(data(:,1), data(:,2))
% xlabel('n (no of points)');
% ylabel('time (secs)');
% title('Unconstrained Spherical Method');
% 
% figure
% plot(data(:,1), data(:,3))
% xlabel('n (no of points)');
% ylabel('time (secs)');
% title('Regularization Method');
% 
% figure
% plot(data(1:5,1), data(1:5,4))
% xlabel('n (no of points)');
% ylabel('time (secs)');
% title('Interior Point Method');


% Plot obj function vs iterations for following methods:
% - LBFGS
% - Regularized
% - Interior Point
data_lbfgs = csvread('obj_n10_lbfgs.csv')
data_regul = csvread('obj_n10_regul.csv')
data_intrpnt = csvread('obj_n10_intrpnt.csv')
 
figure
x1= 1:1:size(data_lbfgs,1);
x2= 1:1:size(data_regul,1);
x3= 1:1:size(data_intrpnt,1);
plot(x1, data_lbfgs(:,1), x2, data_regul(:,1), x3, data_intrpnt(:,1))


xlabel('iterations');
ylabel('objective function');
title('Decrease in obj function for n=10 points');
legend('Unconstrained Spherical Method', 'Regularized Method', 'Interior Point Method');

% Plot no of points vs no of fevals
% data = csvread('fevals.csv')
% data
% 
% figure
% plot(data(:,1), data(:,2))
% xlabel('n (no of points)');
% ylabel('function evaluations');
% title('For the L-BFGS method');
% 
% figure
% plot(data(:,1), data(:,3))
% xlabel('n (no of points)');
% ylabel('function evaluations');
% title('For the Regularization method');
% 
