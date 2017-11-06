function [w]=grdescent(func,w0,stepsize,maxiter,tolerance)
% function [w]=grdescent(func,w0,stepsize,maxiter,tolerance)
%
% INPUT:
% func function to minimize
% w0 = initial weight vector 
% stepsize = initial gradient descent stepsize 
% tolerance = if norm(gradient)<tolerance, it quits
%
% OUTPUTS:
% 
% w = final weight vector
%
if (stepsize <= 1e-03)
    stepsize = 1e-02;
end

if nargin<5,tolerance=1e-02;end;
t= 0;
for i = 1:maxiter
    if(i==5)
        t=t+1;
    end;
  [loss,gradient]= func(w0);
  gra = norm(gradient);
  if (norm(gradient) < tolerance)
      break;
  end
  
  if (i == 1)
      Previous_loss = loss;
      Previous_w = w0;
      w0 = w0 - stepsize * gradient;
  else
      if (loss <= Previous_loss)
          stepsize = stepsize * 1.01;
          w0 = w0 - stepsize * gradient;
          Previous_loss = loss;
          Previous_w = w0;
      else
          stepsize = stepsize * 0.2;
          w0 = Previous_w - stepsize * gradient;
      end
  end
end
w = w0;
