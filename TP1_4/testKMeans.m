M = 1000;
[points,norms] = randomSampling('/media/gozuslayer/Data/Master2DAC/RDFIA/15-Scene-sift/scene/');


[centre,erreur] = solutionKMeans(points,M);

%ajout du vecteur nulle pour les régions homogènes


save('/media/gozuslayer/Data/Master2DAC/RDFIA/Dictionnaire_visuel.mat','centre')
