function [loss,gradient,preds]=hinge(w,xTr,yTr,lambda)
% function w=ridge(xTr,yTr,lambda)
%
% INPUT:
% xTr dxn matrix (each column is an input vector)
% yTr 1xn matrix (each entry is a label)
% lambda regression constant
% w weight vector (default w=0)
%
% OUTPUTS:
%
% loss = the total loss obtained with w on xTr and yTr
% gradient = the gradient at w
%

[d,n]=size(xTr);
loss = sum(max(1 - yTr .* (w' * xTr) , 0)) + lambda * (w'* w);

interMatrix = 1 - yTr .* (w' * xTr);
index = find(interMatrix<=0);
M2 = -repmat(yTr, d , 1) .* xTr;
M2(:,index) = 0;
gradient = sum(M2 , 2) +  2 * lambda * w;
