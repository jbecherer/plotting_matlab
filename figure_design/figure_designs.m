function [fig, ax] = figure_designs( kind, visible)
%  [fig, ax] = figure_designs( kind, visible)
%     
%     kind has following option:
%        11s         :  (1)v x (1)h panels -  (s)quare shape
%        14snl       :  (1)v x (4)h panels -  (s)quare shape -  (n)o separate (l)abels
%        21hnl       :  (2)v x (1)h panels -  (h)ori.  shape -  (n)o separate (l)abels
%        22snl       :  (2)v x (2)h panels -  (s)quare shape -  (n)o separate (l)abels
%        22sxyl      :  (2)v x (2)h panels -  (s)quare shape -  (x) and (y) separate (l)abels
%        23syl       :  (2)v x (3)h panels -  (s)quare shape -  (y) separate (l)abels
%        31hnl       :  (3)v x (1)h panels -  (h)ori.  shape -  (n)o separate (l)abels
%        34snl       :  (3)v x (4)h panels -  (s)quare shape -  (n)o separate (l)abels
%        41hnl       :  (4)v x (1)h panels -  (h)ori.  shape -  (n)o separate (l)abels
%        71snl       :  (7)v x (1)h panels -  (h)ori.  shape -  (n)o separate (l)abels
%
%
%   created by: 
%        Johannes Becherer
%        Tue Oct 22 12:09:12 PDT 2019

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

elseif strcmp(kind, '21hnl') %{{{
   fig = figure('Color',[1 1 1],'visible',visible,'Paperunits','centimeters',...
         'Papersize',[30 20]*.8,'PaperPosition',[0 0 30 20]*.8);
      [ax, ~] = create_axes(fig, 2, 1, 0);
         squeeze_axes(ax, .95 ,.95 );
         shift_axes(ax, 0, 0);

         %}}}

elseif strcmp(kind, '14snl') %{{{
 fig = figure('Color',[1 1 1],'visible',visible,'Paperunits','centimeters',... 
         'Papersize',[42 12]*.8,'PaperPosition',[0 0 42 12]*.8);

         [ax, ~] = create_axes(fig, 1, 4, 0);
         squeeze_axes(ax, 1.1,.9);
         shift_axes(ax, -.05,.05);

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

elseif strcmp(kind, '31hnl') %{{{
   fig = figure('Color',[1 1 1],'visible',visible,'Paperunits','centimeters',...
         'Papersize',[30 20]*.8,'PaperPosition',[0 0 30 20]*.8);
      [ax, ~] = create_axes(fig, 3, 1, 0);
         squeeze_axes(ax, .95 ,.95 );
         shift_axes(ax, 0, 0);

         %}}}

elseif strcmp(kind, '34snl') %{{{
 fig = figure('Color',[1 1 1],'visible',visible,'Paperunits','centimeters',... 
         'Papersize',[42 30]*.8,'PaperPosition',[0 0 42 30]*.8);

         [ax, ~] = create_axes(fig, 3, 4, 0);
         %squeeze_axes(ax, .9,1);
         shift_axes(ax, 0,0);

         %}}}

elseif strcmp(kind, '41hnl') %{{{
   fig = figure('Color',[1 1 1],'visible',visible,'Paperunits','centimeters',...
         'Papersize',[30 30]*.8,'PaperPosition',[0 0 30 30]*.8);
      [ax, ~] = create_axes(fig, 4, 1, 0);
         squeeze_axes(ax, .95 ,.95 );
         shift_axes(ax, 0, 0);

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
