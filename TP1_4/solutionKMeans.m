function [ centre,erreur ] = solutionKMeans( points,M )
%SOLUTIONKMEANS Summary of this function goes here
%   Detailed explanation goes here
%Initialisation des centres
centre = randomSeed(points,M);

nc = assignementKMeans(points,centre);

[newcenter, erreur, movecenters] = miseAjourKMeans(points,centre,nc);
while erreur > 0
    nc = assignementKMeans(points,newcenter);
    [newcenter, erreur, movecenters] = miseAjourKMeans(points,newcenter,nc);
    erreur
end
centre = newcenter;

end

