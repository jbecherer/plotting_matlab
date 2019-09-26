function [fig, ax] = figure_designs( kind, visible)

if nargin < 2
   visible = 'on';
end

if strcmp(kind, '11s') %{{{
   fig = figure('Color',[1 1 1],'visible',visible,'Paperunits','centimeters',...
         'Papersize',[12 10]*.8,'PaperPosition',[0 0 12 10]*.8);
      [ax, ~] = create_axes(fig, 1, 1, 0);
         squeeze_axes(ax, .95 ,.95 );
         shift_axes(ax, 0, 0);

         %}}}

elseif strcmp(kind, '22snl') %{{{

    fig = figure('Color',[1 1 1],'visible',visible,'Paperunits','centimeters',...
            'Papersize',[9 8]*2,'PaperPosition',[0 0 9 8]*2);

            [ax, ~] = create_axes(fig, 2, 2, 0);
               squeeze_axes(ax, 1 ,1)
               shift_axes(ax, 0, 0);
            
    
      %}}}

elseif strcmp(kind, '22sxyl') %{{{

    fig = figure('Color',[1 1 1],'visible',visible,'Paperunits','centimeters',...
            'Papersize',[9 8]*2,'PaperPosition',[0 0 9 8]*2);
    
               for a=1:4
                  ax(a) = subplot( 2, 2, a);
                  hold(ax(a), 'on');
               end
      %}}}

elseif strcmp(kind, '23syl')  %{{{

    fig = figure('Color',[1 1 1],'visible',visible,'Paperunits','centimeters',...
            'Papersize',[30 20]*.7,'PaperPosition',[0 0 30 20]*.7);

            [ax(1:2), ~] = create_axes(fig,2,1, 0);
            [ax(3:4), ~] = create_axes(fig,2,1, 0);
            [ax(5:6), ~] = create_axes(fig,2,1, 0);
               squeeze_axes(ax, .31, 1);
               shift_axes(ax, -.05, 0);
               shift_axes(ax(3:4), .32, 0 );
               shift_axes(ax(5:6), .65, 0 );
               squeeze_axes(ax, 1, .9);
               shift_axes(ax, 0.01, +.05);
         %}}}

elseif strcmp(kind, '71hnl') %{{{
 fig = figure('Color',[1 1 1],'visible', visible,'Paperunits','centimeters',...
         'Papersize',[30 30]*.8,'PaperPosition',[0 0 30 30]*.8);

         [ax, ~] = create_axes(fig, 7, 1, 0);
         shift_axes(ax, -0.02, 0) 
   %}}}


else
   disp(['no configuration found that matches ' kind]);
end

 

end          
