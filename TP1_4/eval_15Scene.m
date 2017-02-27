clear all;
close all;
echo off;  

cate = categories();

baseDir = '/media/gozuslayer/Data/Master2DAC/RDFIA/15-Scene/Scene/';
baseDirDes = '/media/gozuslayer/Data/Master2DAC/RDFIA/15-Scene-sift/Scene/'
pathBow = '/media/gozuslayer/Data/Master2DAC/RDFIA/15-Scene-bow/scene/'

nTrain = 100;
ntest = 2985;
K = 1000;
[imCat, imCatTest] = NbImCatAllTest( pathBow, nTrain);

[train, test] = loadData(nTrain, imCat, pathBow, K);
values = zeros(size(test,1),size(cate,1));
size(values)
for i=1:size(cate,1)
	[y,ytest] = labelsTrainTest(nTrain,ntest,imCat,i);
	values(:,i) = trainTest(train,test,y);
end

	
