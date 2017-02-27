clear all;
close all;
echo off;  
%chargement d'une image

[I,nom] = randomImage('/home/gozuslayer/DAC/DAC/RDFIA/15-Scene/Scene/');
s=16;
delta = 8;
r = denseSampling(I,s,delta);
a = 1; b = size(r,2);
x = floor(a + (b-a) * rand(1));

patch=r(:,x);
%D�finition des masque 1D
hx = 1/2*[1 0 -1];
hy = 1/2*[-1;-2;-1];

%Calcul du vecteur gradient pour chaque pixel de l'image
Ix = convolution_separable(I,hx,hy);
Iy = convolution_separable(I,hy',hx');
Ig = sqrt(Ix.^2+Iy.^2);
Ior = orientation(Ix,Iy,Ig);

%Calcul du masque gaussien
Mg = gaussSIFT(s);

%patch
p = patch;

%Calcul d'un SIFT
sift = computeSIFT(s,Ig(p(1):p(1)+15,p(2):p(2)+15),Ior(p(1):p(1)+15,p(2):p(2)+15),Mg);









