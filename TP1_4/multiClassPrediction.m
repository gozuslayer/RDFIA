function [ matConf,txCat ] = multiClassPrediction( predictclassifieurs, imCatTest)
%MULTICLASSPREDICTION Summary of this function goes here
%   Detailed explanation goes here
    cate = categories();
    txCat = zeros(size(cate,1),1);
    matConf = zeros(size(cate,1),size(cate,1));
    
    prediction = max(predictclassifieurs);
    im = 1
    for i=1:size(imCatTest,1)
        for j=1:imCatTest(i,1)
            if (prediction(im,1) == i) then
          
        end
        
end

