function [ nc ] = assignementKMeans( listPts,centres )

X=listPts;
Y=centres;

%Calcul de la Matrice des distance D(i,j)=distance(X(i),C(j))
D = sum(X.^2,2)*ones(1,size(Y,1)) + ones(size(X,1),1)*sum( Y.^2, 2 )' - 2.*X*Y';

[ row_min, row_argmin ] = min( D, [], 2 );

%On r�cup�re les index des centres les plus proches
nc=[ row_argmin ];

end

