function [] = draw_2dhist(X,Y,XL,YL,ax)
%% [] = draw_2dhist(X,Y,XL,YL,ax)
%
%  Function draws a 2d histogram in the axis ax
%
%
%   created by: 
%        Johannes Becherer
%        Thu Oct 12 11:31:30 PDT 2017


   hold(ax,'on');
   load cmap;
      xl = [min(X) max(X)];
      yl = [min(Y) max(Y)];
      binx = [xl(1):(diff(xl)/50):xl(2)];
      biny = [yl(1):(diff(yl)/50):yl(2)];
   [hist,~,~,~] = hist2d(binx, biny, X, 0, Y, 0, 3);
   pcolor(ax, binx, biny, hist);    shading(ax,'flat');
   %contourf(ax,binx,biny,hist,[0:.1:1]*max(max(hist)), 'edgecolor', 'none');
      plot(ax, binx, binx,'k', 'Linewidth', 1);
      colormap(ax, cmap.chi);
      xlabel(ax, XL)
      ylabel(ax, YL)
      ylim(ax, yl);
      xlim(ax, xl);
      % corelation
         if size(X,2)>size(X,1)
            X = X';
         end
         if size(Y,2)>size(Y,1)
            Y = Y';
         end
         [r, ~, rL, rH] = corrcoef(X( ~isnan(X) & ~isnan(Y) ), Y( ~isnan(X) & ~isnan(Y) ));
         t = text_corner(ax,  {['r = ' num2str(r(2)*100, '%2.1f')  ' % ']; ...
                  ['  [ ' num2str(rL(2)*100, '%2.1f') ', ' num2str(rH(2)*100, '%2.1f') ' ]']}, 6);

end
