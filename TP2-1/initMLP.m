function [ net ] = initMLP( nx , nh , ny)
    net = struct
    net.Hpoids = normrnd(0,0.3,[nh,nx])
    net.Ypoids = normrnd(0,0.3,[ny,nh])
    net.Hbias = normrnd(0,0.3,[nh,1])
    net.Ybias = normrnd(0,0.3,[ny,1])
end

