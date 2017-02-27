%chargement des données
Data = load('circles.mat');
Data_MNIST = load('circles.mat')
Xtest = Data.Xtest;
Ytest = Data.Ytest;
Xtrain = Data.Xtrain;
Ytrain = Data.Ytrain;

%prétraiter les données

%initialisation du réseau
nx=size(Xtrain,2);
nh=size(Xtrain,2)+2;
ny=2; %nombre de classe

net = initMLP(nx,nh,ny);

epoch = 1000;
n = size(Xtrain,1);
size_minibatch = n/20;
eta = 0.01;
K1 = 10;
K2 = 10;


%apprentissage : epoch itérations


for i=1:epoch
    index_minibatch = randperm(n,size_minibatch);
    
    [Yhat , out] = forward(net,Xtrain(index_minibatch,:));
    net = backward( net,out,Ytrain(index_minibatch,:),eta);
    
    [L_batch , acc_batch] = loss_accuracy(Yhat,Ytrain(index_minibatch,:));
    
    %Loss et accuracy sur tout l'ensemble de train
    if mod(i,K1)==0
        [Yhat, ] = forward(net,Xtrain);
        [loss_train, acc_train] = loss_accuracy(Yhat,Ytrain);
    end
    
    %Loss et accuracy sur l'ensemble de test
    if mod(i,K2)==0
        [Yhat, ] = forward(net,Xtest);
        [loss_test,acc_test] = loss_accuracy(Yhat,Ytest);
    end
    
        
        
end    
    
%Générer une grille de points
[x1,x2] = meshgrid(-2:0.1:2);
x1 = reshape(x1,size(x1,1)^2,1);
x2 = reshape(x2,size(x2,1)^2,1);
Xgrid = [x1 x2];

%Affichage de la classification
[Ygrid, ~] = forward(net, Xgrid);
grid = Ygrid(:,1);

plot((Xtrain(Ytrain(:,1)>.5,1) + 2 )*10, (Xtrain(Ytrain(:,1)>.5,2) + 2 )*10,'o','color','blue')
hold on;
plot((Xtrain(Ytrain(:,2)>.5,1) + 2 )*10, (Xtrain(Ytrain(:,2)>.5,2) + 2 )*10,'o','color','red')