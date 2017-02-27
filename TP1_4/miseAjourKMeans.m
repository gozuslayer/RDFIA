function [ newscenter,erreur,movecenter ] = miseAjourKMeans( listPts,centers,nc )
%MISEAJOURKMEANS Summary of this function goes here
%   Detailed explanation goes here
M = size(centers,1);
d = size(centers,2);
newscenter = zeros(M,d);
movecenter = zeros(M,d);
for i=1:M
    index = find(nc==i);
    newscenter(i,:) = (1/size(index,1))*sum(listPts(index,:),1);
    movecenter(i,:) = newscenter(i,:)-centers(i,:);
end
erreur = sum(sum(movecenter.^2,1),2);
    



end

