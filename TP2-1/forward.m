function [ Yhat, out ] = forward( net , X )
    n = size(X,1);
    out = struct;
    out.X = X
    out.Hvague = (net.Hpoids*X' + net.Hbias*ones(1,n))'
    out.H = arrayfun(@tanh, out.Hvague)
    out.Yvague = (net.Ypoids*out.H' + net.Ybias*ones(1,n))'
    out.Yhat = softmax(out.Yvague')'
    Yhat = out.Yhat
end

