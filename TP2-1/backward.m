function [ net ] = backward( net,out,Y,eta )
    n = size(Y,1)

    delta_y = out.Yhat - Y
    l_Wy = delta_y'*out.H
    l_by = sum(delta_y,1)'
    delta_h = ((net.Ypoids)'*delta_y')'.*arrayfun(@tanhprime,out.Hvague)
    l_Wh = delta_h'*out.X
    l_bh = sum(delta_h,1)'
    
    net.Hbias = net.Hbias - (eta/n)*l_bh
    net.Hpoids = net.Hpoids - (eta/n)*l_Wh
    net.Ybias = net.Ybias - (eta/n)*l_by
    net.Ypoids = net.Ypoids - (eta/n)*l_Wy


end

