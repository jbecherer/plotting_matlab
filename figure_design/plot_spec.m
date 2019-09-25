function [F_U, PS, p1] = plot_spec(ax, X, fs, varargin)
%%  [f, P, p1] = plot_spec(ax, X, fs, [color], [nW])
%     this  function plots a spectrum of X with sample freq fs in ax
%     color = color of the plot
%     nW = number of windows (default =1);
%     lin = line element handle


if(nargin<4)
   col           = [0 0 0];
   nW            = 1;
   varpreserving = 0;
elseif(nargin<5)
   col   = varargin{1};
   nW    = 1;
   varpreserving = 0;
elseif(nargin<6)
   col   = varargin{1};
   nW    = varargin{2};
   varpreserving = 0; 
else
   col   = varargin{1};
   nW    = varargin{2};
   varpreserving = varargin{3};
end

   % % set spectrum parameters
   N = length(X);
   NFFTmax = 2^floor(log2(N/nW));  % set largest possible power 2 segment 
   Fmin    = NFFTmax*fs;              % lowest frequency range from 0 to Fmin
   Ffac    = 4;                % increase frequency range by this factor
   p       = 0.95;             % set confidence interval
   pPlot   = 5e-1;             % plot confidence intervals around this value

   [F_U , PS, ctop, cbot]  = iow_fancypsd( X, NFFTmax, Ffac, Fmin, fs, p, pPlot);

   Nbin = 10;
   cnt = 1;
   while 1
    l = 2^(cnt);
    if (length(PS)>(l*Nbin+l))
       PS((l*Nbin):end) = movmean(PS((l*Nbin):end),l);
    else
        break; 
    end
    cnt = cnt+1; 
   end
   
   if( isreal(PS(1)) )
     if varpreserving
        p1 = plot(ax, F_U, PS.*F_U, 'color', col);
     else
        p1 = plot(ax, F_U, PS, 'color', col);
     end
      hold(ax, 'on');
   else
      if varpreserving
          p1 = plot(ax, F_U, real(PS).*F_U, '--', 'color', col);
          hold(ax, 'on');
          p2 = plot(ax, F_U, imag(PS).*F_U, 'color', col);
      else
          p1 = plot(ax, F_U, real(PS), '--', 'color', col);
          hold(ax, 'on');
          p2 = plot(ax, F_U, imag(PS), 'color', col);
      end
      legend([p1, p2], 'anti-clockwise', 'clockwise' );
   end

      xlabel(ax, 'f [Hz]');
      set(ax, 'Yscale', 'log','Xscale', 'log','TickDir','out', 'color', 'none');
end
