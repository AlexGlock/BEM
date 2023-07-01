clear all;
close all;

% Low Rank Compressibility -----------------------------------------------------
% a)

N = 100;
d = 2;

L = 100;

plot_G = false;
plot_pcs = false;
plot_svd_G = false;
plot_svd_M = true;

% first pointcloud
points = rand([N, 3])*2-1;
if plot_pcs
  figure(1)
  scatter3(points(:,1), points(:,2), points(:,3),"s")
endif

% second pointcloud ------------------------------------------------------------
% b)
points2=points;
vec = [1, 1, 1]*d;
for idx = (1:N)
  points2(idx,:) = points(idx,:)+vec;
end
if plot_pcs
  figure(1)
  scatter3(points2(:,1), points2(:,2), points2(:,3),"r")
endif

% compute and store point interaction ------------------------------------------
% c)
G = zeros(N,N);

for i = (1:N)
  for j = (1:N)
    G(i,j) = 1/(4*pi*norm(points(i,:)-points2(j,:)));
  endfor
endfor
if plot_G
  figure(2)
  spy(G)
endif

% singular value decomposition -------------------------------------------------
% d)  U*S*V = G

[U,S,V] = svd(G);
norm_sv = diag(S)*(1/diag(S)(1));
if plot_svd_G
  figure(3)
  plot(norm_sv);
  title("normalized singular values of G");
endif

% c) different values for Param "d" show that a larger distance between clusters
%    leads to a fast convergence of the smaller singular values towards zero and
%    therefore enables a good compression with small errors

% random Matrix compression ----------------------------------------------------
% d)

M = rand(L,L);
[_,SVS,_] = svd(M);
norm_svs = diag(SVS)*(1/diag(SVS)(1));
if plot_svd_M
  figure(4)
  plot(norm_svs)
  title("normalized singular values of random M matrix");
endif
% M is not low rank comressible. singular values are not small enough
