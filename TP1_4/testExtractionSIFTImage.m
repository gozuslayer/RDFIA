clear all;
close all;
echo off;  

%Chargement d'une image
I = randomImage('/media/gozuslayer/Data/Master2DAC/RDFIA/15-Scene/Scene/');

sifts = computeSIFTsImage(I);
s=16;
delta = 8;
r = denseSampling(I,s,delta);
drawPatches(I,r,s,sifts')