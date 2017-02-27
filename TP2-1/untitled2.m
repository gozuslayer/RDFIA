[x1,x2] = meshgrid(-2:0.1:2);
Data = load('circles.mat');
Data_MNIST = load('circles.mat')
Xtest = Data.Xtest;
Ytest = Data.Ytest;
Xtrain = Data.Xtrain;
Ytrain = Data.Ytrain;
plot(Xtrain(Ytrain(:,1)>.5,1), Xtrain(Ytrain(:,1)>.5,2),'o','color','blue');
hold on;
plot(Xtrain(Ytrain(:,2)>.5,1), Xtrain(Ytrain(:,2)>.5,2),'o','color','red');

