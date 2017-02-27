function [ L,acc ] = loss_accuracy( Yhat , Y )
    Yhat_log = arrayfun(@log,Yhat)
    L = -Y.*Yhat_log
    L = sum(sum(L,2),1)
    
    %accuracy (TP + TN)/TOTAL
    
    [max_Yhat, argmax_Yhat] = max(Yhat,[],2)
    [max_Y, argmax_Y] = max(Y,[],2)
    acc = argmax_Yhat - argmax_Y
    acc = sum(acc(:)==0)/size(acc,1)
end

