function [ values ] = trainTest(train,test,y)
%TRAINTEST Summary of this function goes here
%   Detailed explanation goes here
    model = svmtrain(y,train,'c 1000 -t linear');
    [w,b] = getPrimalSVMParameters(model);
    size(test)
    size(w)
    values = w'*test' + b;
    values = values';


end

