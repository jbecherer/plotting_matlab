function [lg, con_lg, r, con_r] = linearReg(x,y, regtyp)
%% [lg, con_lg, r, con_r] = linearReg(x,y)
%
%  This function calculates the coefficients of a simple inear regression 
%  between signals x,y with
%
%  
%
%
%  OUTPUT
%     lg       :  linear regrssion coeffs  y = lg(1)*x + lg(2)
%     con_lg   :  95% convidence intervals on coeffs
%     r        :  correlation coeff
%     con_r    :  convidence interval for r
%     regtyp   : 0            : slope   y = lg* x        no off-set   
%                1  (default) : linear   y = lg(1)*x + lg(2) 
%                2-inf        : just using polyfit, no error on coeff con_lg = []
%
%
%   created by: 
%        Johannes Becherer
%        Wed Nov 13 11:29:57 PST 2019


if nargin <3
   regtyp = 1;
end

% remove nans
   ii_nnan = ~isnan(x) & ~isnan(y);
   x = x(ii_nnan);
   y = y(ii_nnan);


   N = length(x);

   if regtyp == 1  % linear regression

      % Walters Book eq. 8.6
      lg(1) =  ( N*sum(x.*y)-sum(x)*sum(y) )/( N*sum(x.*x)- sum(x)^2 );
      lg(2) =  ( sum(x.*x)*sum(y) - sum(x)*sum(x.*y) )/( N*sum(x.*x)-sum(x)^2  );

      % eq. 8.8
      stdy = ( 1/(N-2) * sum( (y-lg(1)*x-lg(2)).^2 ) )^.5

      % eq 8.9 std of slope and offset
      std_lg(1) = stdy * ( N/( N*sum(x.*x)-sum(x)^2 ) )^.5; 
      std_lg(2) = stdy * ( sum(x.*x)/( N*sum(x.*x)-sum(x)^2 ) )^.5; 

      % convedence limits for 95% (only valid for N>20) for smaller sample 
      % the pre factor 2 needs to be adjusted according to Walter table 6.1
      con_lg(1,:) = lg(1) + 2*[-1 1]*std_lg(1);
      con_lg(2,:) = lg(2) + 2*[-1 1]*std_lg(2);

   elseif regtyp == 0  % just slope

      % Walters Book eq. 8.12 
      lg    =  sum(x.*y)/sum(x.*x);
      % eq. 8.13
      stdy  = ( 1/(N-1) * sum( (y-lg*x).^2 ) )^.5;
      % eq 8.14
      std_lg = stdy/sqrt(sum(x.*x));
      con_lg = lg + 2*[-1 1]*std_lg;

   else % polyfit

      lg = polyfit(x,y,regtyp);
      con_lg = [];

   end

      
    

  if nargout > 3
      [R, ~, rl, ru] = corrcoef(x,y);

      r= R(1,2);
      con_r(1) = rl(1,2);
      con_r(2) = ru(1,2);

    % try to come up with errors for r 
    % this is not exactly the same as corcoeff but really close
    % gives bigger error  % trying to do quadratischer fehler fortpflanzung

      % %stdr = stdy*sqrt(1/(sum(xp.^2)*sum(yp.^2))^.5);
      % stdr = stdy*(sum(xp.^2)*sum(yp.^2))^-.25;
      % con_r(1) = r - 2*stdr;
      % con_r(2) = r + 2*stdr;
  else
      % correlation coeff according to walter 8.22
       xp = x- mean(x);
       yp = y- mean(y);
         r = sum(xp.*yp)/(sum(xp.^2)*sum(yp.^2))^.5;
   end

end

