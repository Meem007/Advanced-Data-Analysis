clear all
close all
clc

load wine.txt           %loading the data

feature = wine(:,1:11)';       % columns of length 11
quality = wine(:,12)';      % 12th number column as target
n = size(feature,2);


figure(1)                   % plot x_i vs x_j for all combinations of i,j
for i=1:11
  for j=1:i-1
     subplot(10,10,(i-1)+10*(j-1))
     scatter(feature(i,:),feature(j,:),7,quality,'filled')
     xlabel(sprintf('x%g',i)); ylabel(sprintf('x%g',j))
  end
end


%performin PCA

feature_mean = mean(feature,2)           % find mean
A = feature - feature_mean*ones(1,n);    % subtract mean from each point
rho = norm(A,'fro')^2       % total variation of data

[U,S,V] = svd(A,'econ');    % find singular value decomposition
sigma = diag(S)             % singular values

rho = norm(sigma)^2 


C = S(1:3,1:3)*V(:,1:3)';   % first 3 coefficients for each point, same as U(:,1:5)'*A;

q2 = norm(sigma(1:2))^2/rho % part of variation captured by first 2 components
figure(2);
scatter(C(1,:),C(2,:),17,quality,'filled')
xlabel('PC1'); ylabel('PC2')
title(sprintf('two principal components, captures %.4g%% of total variation',100*q2))

C(1,:)



q3 = norm(sigma(1:3))^2/rho   % part of variation captured by first 3 components
figure(5);
scatter3(C(1,:),C(2,:),C(3,:),27,quality,'filled')

xlabel('PC1'); ylabel('PC2'); zlabel('PC3')
title(sprintf('3 components, captures %.4g%% of total variation',100*q3))
% you can rotate and spin this graph with the mouse
