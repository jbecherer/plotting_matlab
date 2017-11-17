clear all;
close all;

addpath(genpath('~/arbeit/matlab_tbx/plotting_matlab/'));

load ../mat/adcp_clean.mat;



time = A.time;
U    = A.U;
z    = A.zf;





[ax , fig] = adcp_plot( time, z, U);
%print(gcf,'../pics/adcp_overview.png','-dpng','-r100','-painters')

return


xl = time([1 end]);
yl = [min((min(z))) 0];
cl = [-1 1]*max(max((abs(U))));

load cmap

 fig = figure('Color',[1 1 1],'visible','on','Paperunits','centimeters',...
         'Papersize',[30 20],'PaperPosition',[0 0 30 20])
 
         [ax, ~] = create_axes(fig, 2, 1, 0);
             shift_axes(ax, -.02, 0);
         

         a=1;
         pcolor(ax(a), time, z, u)
            shading(ax(a), 'flat');
            caxis(ax(a), cl);
            cb = colorbar('peer', ax(a));
               axpos = get(ax(a), 'Position');
               cb.Position =  [axpos(1)+axpos(3)+.01 axpos(2) .02 axpos(4) ];
            colormap(ax(a), cmap.vel2);
            ylabel(ax(a), 'z [m]')

            t = text_corner(ax(a), ['u [m/s]'], 1);
            t.BackgroundColor = [1 1 1 .5];
            xlim(ax(a), xl);
            ylim(ax(a), yl);

            
         a=2;
         pcolor(ax(a), time, z, v)
            shading(ax(a), 'flat');
            caxis(ax(a), cl);
            cb = colorbar('peer', ax(a));
               axpos = get(ax(a), 'Position');
               cb.Position =  [axpos(1)+axpos(3)+.01 axpos(2) .02 axpos(4) ];
            colormap(ax(a), cmap.vel2);
            ylabel(ax(a), 'z [m]')

            t = text_corner(ax(a), ['v [m/s]'], 1);
            t.BackgroundColor = [1 1 1 .5];
            xlim(ax(a), xl);
            ylim(ax(a), yl);

            datetick(ax(a), 'keeplimits');
            
            linkaxes(ax, 'x');
            
               
            
            
   
            
            
            
                  
