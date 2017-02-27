function [ bow, nc ] = computeBow( sifts, clusters)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
%hard assignement
nc = assignementKMeans(sifts,clusters);

%pooling
bow = zeros(size(clusters,1),1);

for i = 1:size(clusters,1)
    bow(i) = sum(nc==i);
end

%normalisation l1
bow = 1/size(sifts,2)*bow;

end

