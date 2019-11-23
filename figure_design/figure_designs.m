function [fig, ax] = figure_designs( kind, visible)
%  [fig, ax] = figure_designs( kind, visible)
%     
%     kind has following option:
%        11s         :  (1)v x (1)h panels -  (s)quare shape
%        11h         :  (1)v x (1)h panels -  (h)horizontal shape
%        12hnl       :  (1)v x (2)h panels -  (s)quare shape -  (n)o separate (l)abels
%        12syl       :  (1)v x (2)h panels -  (s)quare shape -  (y) separate (l)abels
%        13syl       :  (1)v x (3)h panels -  (s)quare shape -  (y) separate (l)abels
%        14syl       :  (1)v x (4)h panels -  (s)quare shape -  (y) separate (l)abels
%        15syl       :  (1)v x (5)h panels -  (s)quare shape -  (y) separate (l)abels
%        14snl       :  (1)v x (4)h panels -  (s)quare shape -  (n)o separate (l)abels
%        21hnl       :  (2)v x (1)h panels -  (h)ori.  shape -  (n)o separate (l)abels
%        21snl       :  (2)v x (1)h panels -  (s)quare shape -  (x) separate (l)abels
%        21sxl       :  (2)v x (1)h panels -  (s)quare shape -  (x)  separate (l)abels
%        22snl       :  (2)v x (2)h panels -  (s)quare shape -  (n)o separate (l)abels
%        22sxyl      :  (2)v x (2)h panels -  (s)quare shape -  (x) and (y) separate (l)abels
%        23syl       :  (2)v x (3)h panels -  (s)quare shape -  (y) separate (l)abels
%        23sxyl      :  (2)v x (3)h panels -  (s)quare shape -  (y) and (x) separate (l)abels
%        24sxyl      :  (2)v x (4)h panels -  (s)quare shape -  (y) and (x) separate (l)abels
%        24snl       :  (2)v x (4)h panels -  (s)quare shape -  (n)o (l)abels
%        31hnl       :  (3)v x (1)h panels -  (h)ori.  shape -  (n)o separate (l)abels
%        34snl       :  (3)v x (4)h panels -  (s)quare shape -  (n)o separate (l)abels
%        41hnl       :  (4)v x (1)h panels -  (h)ori.  shape -  (n)o separate (l)abels
%        51hnl       :  (5)v x (1)h panels -  (h)ori.  shape -  (n)o separate (l)abels
%        61hnl       :  (6)v x (1)h panels -  (h)ori.  shape -  (n)o separate (l)abels
%        71snl       :  (7)v x (1)h panels -  (h)ori.  shape -  (n)o separate (l)abels
%
%
%   created by: 
%        Johannes Becherer
%        Tue Oct 22 12:09:12 PDT 2019

if nargin < 2
   visible = 'on';
end

if strcmp(kind, '11s') % {{{
   fig = figure('Color',[1 1 1],'visible',visible,'Paperunits','centimeters',...
         'Papersize',[12 10]*.8,'PaperPosition',[0 0 12 10]*.8);
      [ax, ~] = create_axes(fig, 1, 1, 0);
         squeeze_axes(ax, .9 ,.9 );
         shift_axes(ax, .06, .06);

         %}}}

elseif strcmp(kind, '11h') % {{{
   fig = figure('Color',[1 1 1],'visible',visible,'Paperunits','centimeters',...
         'Papersize',[22 10]*.8,'PaperPosition',[0 0 22 10]*.8);
      [ax, ~] = create_axes(fig, 1, 1, 0);
         squeeze_axes(ax, .9 ,.9 );
         shift_axes(ax, .06, .06);

         %}}}

elseif strcmp(kind, '12snl') %{{{
   fig = figure('Color',[1 1 1],'visible',visible,'Paperunits','centimeters',...
         'Papersize',[22 10]*.8,'PaperPosition',[0 0 22 10]*.8);
      [ax, ~] = create_axes(fig, 1, 2, 0);
         squeeze_axes(ax, .95 ,.95 );
         shift_axes(ax, 0, 0);

         %}}}

elseif strcmp(kind, '12syl') %{{{
   fig = figure('Color',[1 1 1],'visible',visible,'Paperunits','centimeters',...
         'Papersize',[22 10]*.8,'PaperPosition',[0 0 22 10]*.8);
         for a=1:2
            ax(a) = subplot( 1, 2, a);
            hold(ax(a), 'on');
         end
         squeeze_axes(ax, 1.1 ,.95 );
         shift_axes(ax, -.05, .06);
         

         %}}}

elseif strcmp(kind, '13syl') %{{{
   fig = figure('Color',[1 1 1],'visible',visible,'Paperunits','centimeters',...
         'Papersize',[32 10]*.8,'PaperPosition',[0 0 33 10]*.8);
         for a=1:3
            ax(a) = subplot( 1, 3, a);
            hold(ax(a), 'on');
         end
         squeeze_axes(ax, 1.15 ,.95 );
         shift_axes(ax, -.05, .06);

         

         %}}}

elseif strcmp(kind, '14syl') %{{{
   fig = figure('Color',[1 1 1],'visible',visible,'Paperunits','centimeters',...
         'Papersize',[32 9]*.8,'PaperPosition',[0 0 33 9]*.8);
         for a=1:4
            ax(a) = subplot( 1, 4, a);
            hold(ax(a), 'on');
         end
         squeeze_axes(ax, 1.15 ,.95 );
         shift_axes(ax, -.05, .06);

         

         %}}}

elseif strcmp(kind, '14snl') %{{{
 fig = figure('Color',[1 1 1],'visible',visible,'Paperunits','centimeters',... 
         'Papersize',[42 12]*.8,'PaperPosition',[0 0 42 12]*.8);

         [ax, ~] = create_axes(fig, 1, 4, 0);
         squeeze_axes(ax, 1.1,.9);
         shift_axes(ax, -.05,.05);

         %}}}

elseif strcmp(kind, '15syl') %{{{
   fig = figure('Color',[1 1 1],'visible',visible,'Paperunits','centimeters',...
         'Papersize',[32 7],'PaperPosition',[0 0 33 7]);
         for a=1:5
            ax(a) = subplot( 1, 5, a);
            hold(ax(a), 'on');
         end
         squeeze_axes(ax, 1.18 ,.95 );
         shift_axes(ax, -.07, .06);

         

         %}}}

elseif strcmp(kind, '21sxl') %{{{
   fig = figure('Color',[1 1 1],'visible',visible,'Paperunits','centimeters',...
         'Papersize',[11 20]*.8,'PaperPosition',[0 0 11 20]*.8);
         for a=1:2
            ax(a) = subplot( 2, 1, a);
            hold(ax(a), 'on');
         end
         squeeze_axes(ax, .95 ,1 );
         shift_axes(ax, 0.03, 0);

         

         %}}}

elseif strcmp(kind, '21hnl') %{{{
   fig = figure('Color',[1 1 1],'visible',visible,'Paperunits','centimeters',...
         'Papersize',[30 20]*.8,'PaperPosition',[0 0 30 20]*.8);
      [ax, ~] = create_axes(fig, 2, 1, 0);
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

elseif strcmp(kind, '21sxl') % {{{

    fig = figure('Color',[1 1 1],'visible',visible,'Paperunits','centimeters',...
            'Papersize',[9 16],'PaperPosition',[0 0 9 16]);
               for a=1:2
                  ax(a) = subplot( 2, 1, a);
                  hold(ax(a), 'on');
               end
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

elseif strcmp(kind, '23sxyl') %{{{
   fig = figure('Color',[1 1 1],'visible',visible,'Paperunits','centimeters',...
         'Papersize',[32 20]*.8,'PaperPosition',[0 0 33 20]*.8);
         for a=1:6
            ax(a) = subplot( 2, 3, a);
            hold(ax(a), 'on');
         end
         squeeze_axes(ax, 1.15 ,1 );
         shift_axes(ax, -.05, .00);

         %}}}

elseif strcmp(kind, '24sxyl') %{{{
   fig = figure('Color',[1 1 1],'visible',visible,'Paperunits','centimeters',...
         'Papersize',[35 18]*1,'PaperPosition',[0 0 35 18]*1);
         for a=1:8
            ax(a) = subplot( 2, 4, a);
            hold(ax(a), 'on');
         end
         squeeze_axes(ax, 1.15 ,1 );
         shift_axes(ax, -.05, .00);

         %}}}

elseif strcmp(kind, '24snl') % {{{

    fig = figure('Color',[1 1 1],'visible',visible,'Paperunits','centimeters',...
            'Papersize',[18 8]*1.5,'PaperPosition',[0 0 18 8]*1.5);

            [ax, ~] = create_axes(fig, 2, 4, 0);
               squeeze_axes(ax, 1.05 ,1)
               shift_axes(ax, -.02, 0);
            
    
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
         'Papersize',[30 25]*.8,'PaperPosition',[0 0 30 26]*.8);
      [ax, ~] = create_axes(fig, 4, 1, 0);
         squeeze_axes(ax, .95 ,.95 );
         shift_axes(ax, 0, 0);

         %}}}

elseif strcmp(kind, '51hnl') %{{{
   fig = figure('Color',[1 1 1],'visible',visible,'Paperunits','centimeters',...
         'Papersize',[30 30]*.8,'PaperPosition',[0 0 30 30]*.8);
      [ax, ~] = create_axes(fig, 5 , 1, 0);
         squeeze_axes(ax, .95 ,.95 );
         shift_axes(ax, 0, 0);

         %}}}

elseif strcmp(kind, '61hnl') %{{{
   fig = figure('Color',[1 1 1],'visible',visible,'Paperunits','centimeters',...
         'Papersize',[30 30]*.8,'PaperPosition',[0 0 30 30]*.8);
      [ax, ~] = create_axes(fig, 6 , 1, 0);
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
