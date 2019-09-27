function [ax, fig] = adcp_plot( time, z, U, ax)
%%    [ax, fig] = adcp_plot( time, z, U, [ax])
%
%     This function plots gridded velocity data
%
%
%  INPUT
%     time     :  time -vector
%     z        :  vertcial vector
%     U        :  velocity either (real or complex)
%     ax       :  optional if not given a new figure is created 

load cmap

% find out if real or complex
really = isreal(U);

Nu = numel(U);

u = real(U);
v = imag(U);

xl = time([1 end]);
yl = [min((min(z))) max( [max(max(z)), 0])];
if sum(sum( real(U)<0 )) > 0 % symetric coloraxes 
   sort_u  = sort( abs(u(~isnan(u)))); 
   maxreal = sort_u( floor( length(sort_u)/100*98) ); % 98 % max value
   if ~really
      sort_v  = sort(abs(v(~isnan(v)))); 
      maximag = sort_v( floor(length(sort_v)/100*98) ); % 98 % max value
      cl = [-1 1]* max([maxreal maximag]);
   else
      cl = [-1 1]* maxreal;
   end
   colmap = cmap.vel2;
else     % strictly possitive axes
   sort_u  = sort( abs(u(~isnan(u)))); 
   maxreal = sort_u( floor( length(sort_u)/100*98) ); % 98 % max value
   cl = [0 1]*maxreal;
   colmap = cmap.hblvil;
end




% if no axes are given
if nargin < 4
    fig = figure('Color',[1 1 1],'visible','off','Paperunits','centimeters',...
            'Papersize',[30 20],'PaperPosition',[0 0 30 20])
         if really
            [ax, ~] = create_axes(fig, 1, 1, 0);
         else
            [ax, ~] = create_axes(fig, 2, 1, 0);
         end
         shift_axes(ax, -.02, 0);
else
   fig = ax.Parent;
end
         

         a=1;
         pcolor(ax(a), time, z, u)
            shading(ax(a), 'flat');
            caxis(ax(a), cl);
            cb = colorbar('peer', ax(a));
               axpos = get(ax(a), 'Position');
               cb.Position =  [axpos(1)+axpos(3)+.01 axpos(2) .02 axpos(4) ];
            colormap(ax(a), colmap);
            ylabel(ax(a), 'z [m]')

            t = text_corner(ax(a), ['u [m/s]'], 1);
            t.BackgroundColor = [1 1 1 .5];
            xlim(ax(a), xl);
            ylim(ax(a), yl);
            if really
               datetick(ax(a), 'keeplimits');
            end

       if ~really
         a=2;
         pcolor(ax(a), time, z, v)
            shading(ax(a), 'flat');
            caxis(ax(a), cl);
            cb = colorbar('peer', ax(a));
               axpos = get(ax(a), 'Position');
               cb.Position =  [axpos(1)+axpos(3)+.01 axpos(2) .02 axpos(4) ];
            colormap(ax(a), colmap);
            ylabel(ax(a), 'z [m]')

            t = text_corner(ax(a), ['v [m/s]'], 1);
            t.BackgroundColor = [1 1 1 .5];
            xlim(ax(a), xl);
            ylim(ax(a), yl);

            datetick(ax(a), 'keeplimits');
            
            linkaxes(ax, 'x');
         end
