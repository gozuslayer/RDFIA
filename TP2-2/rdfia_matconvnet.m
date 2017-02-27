clc;
clear all;
close all;

%initialisation de MatConvNet sous Matlab
run C:\Users\king\Desktop\matconvnet-1.0-beta23\matlab\vl_setupnn;

%Chargement du modele CNN-F
net = load('C:\Users\king\Desktop\imagenet\imagenet-vgg-f.mat');
net = vl_simplenn_tidy(net); 

vl_simplenn_display(net ,'inputSize', [224  224 3 1])

im = imread('peppers.png');
im_ = single(im);
im_ = imresize(im_, net.meta.normalization.imageSize(1:2));
im_ = im_ - net.meta.normalization.averageImage;

res = vl_simplenn(net , im_);

scores = squeeze(gather(res(end).x));
[bestScore, best] = max(scores);
figure(1);clf;imagesc(res{7});
title(sprintf('%s (%d) , score %.3f',net.meta.classes.description{best},best,bestScore));