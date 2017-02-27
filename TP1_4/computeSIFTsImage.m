function [ sifts ] = computeSIFTsImage( I )
%COMPUTESIFTSIMAGE Summary of this function goes here
%   Detailed explanation goes here
s=16;
delta=8;
%Calcul du gradient en chaque pixel
hx = 1/2*[1 0 -1];
hy = 1/2*[-1;-2;-1];
Ix = convolution_separable(I,hx,hy);
Iy = convolution_separable(I,hy',hx');
Ig = sqrt(Ix.^2+Iy.^2);
Ior = orientation(Ix,Iy,Ig);
Mg = gaussSIFT(s);

%d�coupage de l'image en patch
r = denseSampling(I,s,delta);

%initialisation des sifts
sifts = zeros(size(r,2),128);
for i=1:size(r,2)
    sifts(i,1:128) = computeSIFT(s,Ig(r(1,i):r(1,i)+15,r(2,i):r(2,i)+15),Ior(r(1,i):r(1,i)+15,r(2,i):r(2,i)+15),Mg);
end
end

