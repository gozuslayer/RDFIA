clear all;
close all;
echo off;  

clusters = load('/media/gozuslayer/Data/Master2DAC/RDFIA/Dictionnaire_visuel.mat');
clusters = clusters.centre;
cate = categories();

% A REMPLACER AVEC LE DOSSIER CONTENANT LES descripteurs sifts
pathim = '/media/gozuslayer/Data/Master2DAC/RDFIA/15-Scene-sift/scene/';

% A REMPLACER AVEC LE DOSSIER CONTENANT LES DESCRIPTEURS bOW
pathdes = '/media/gozuslayer/Data/Master2DAC/RDFIA/15-Scene-bow/scene/';

s= 16;
delta = 8;

catinit = 1;
catend =15;

i = 0;
for index=catinit:catend
    
    cat = cate{index};
    % CREATION DU DOSSIER DESCRIPTEURS POUR LA CLASSE SI INEXISTANT
    pathcat = strcat(pathdes,cat,'/');
    if(exist(pathcat)==0)
        mkdir(pathcat);
    end
    
    tstarttot= tic;

    direc = strcat(pathim,cat,'/');
    listima=dir([direc '*.mat'] );
    n=length(listima);
    
    
    % CALCUL DES DESCRIPTEURS POUR LA CLASSE INDEX 
    for num=1:n
        % OUVERTURE  IMAGE
        sifts = load(strcat(direc,listima(num).name));
        
        % CALCUL DES SIFTs (VOTRE FONCTION)
        sifts = sifts.sifts ;
        [bow , nc] = computeBow(double(sifts),double(clusters));
     


        desname = strcat(pathcat,listima(num).name(1:length(listima(num).name)-4),'.mat');
        
        save(desname,'bow');
        
        if(mod(num,100)==0)
            strcat('nb patchs=',num2str(size(sifts,2)))
            tcal = toc(tstarttot);
            strcat('temps de calcul =',num2str(tcal))
        end
    end
    
      
    
    tcaltot = toc(tstarttot);
    
    
    strcat('computation time for category :',cat,' =',num2str(tcaltot))
    
    
end
