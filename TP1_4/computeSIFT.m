function [sift] = computeSIFT (s,Ig,Ior,Mg)
sift = zeros(1,128);

for it=1:4:s
    for jt=1:4:s        
        sum_littlesift = zeros(1,8);
        for i= it:3+it
            for j=jt:3+jt
                littlesift = zeros(1,8);
                if (Ior(i,j)>0)
                        
                    littlesift(1,Ior(i,j)) = Ig(i,j)*Mg(i,j);
                    
                end                
                sum_littlesift = sum_littlesift + littlesift;
                
            end
        end
        sift(1,it + jt-1:it + jt+6) = sum_littlesift;
    end
end

if (sum(sift.*sift,2)<0.5)
    sift = zeros(1,128);
end
end

        
        
    