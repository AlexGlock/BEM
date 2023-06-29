clear all;
close all;

% Low Rank Compressibility
% a)

N = 100;
d = 2;

% first pointcloud
points = rand([N, 3])*2-1;
figure(1)
scatter3(points(:,1), points(:,2), points(:,3))

% second pointcloud
points2=points;
vec = [1, 1, 1]*2;
for idx = (1:N)
  points2(idx,:) = points(idx,:)+vec;
end
figure(2)
scatter3(points2(:,1), points2(:,2), points2(:,3))
