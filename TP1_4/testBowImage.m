baseDir = '/media/gozuslayer/Data/Master2DAC/RDFIA/15-Scene/Scene/';
baseDirDes = '/media/gozuslayer/Data/Master2DAC/RDFIA/15-Scene-sift/Scene/'

[I, nomim, sifts] = randomImageDes (baseDir, baseDirDes)

%appel de computeBow
clusters = load('/media/gozuslayer/Data/Master2DAC/RDFIA/Dictionnaire_visuel.mat')
clusters = clusters.centre
size(sifts)
size(clusters)
[bow,nc] = computeBow(double(sifts),double(clusters))

[patchmin] = visuDico('/media/gozuslayer/Data/Master2DAC/RDFIA/Dictionnaire_visuel.mat',baseDir, baseDirDes)
visuBoW(I,patchmin,bow,nc',nomim)