clear all;
visible = 'off';
cnt = 1;

kind{cnt} = '11s';   cnt = cnt+1;
kind{cnt} = '14snl';   cnt = cnt+1;
kind{cnt} = '22snl'; cnt = cnt+1;
kind{cnt} = '22sxyl'; cnt = cnt+1;
kind{cnt} = '23syl'; cnt = cnt+1;
kind{cnt} = '34snl';   cnt = cnt+1;
kind{cnt} = '71hnl'; cnt = cnt+1;


for k = 1:length(kind)
   [fig, ax] = figure_designs( kind{k}, visible);
      text_corner(ax(1), [kind{k}], 2);
      print(gcf,['./fig_exp/' kind{k}  '.png'],'-dpng','-r100','-painters');
      close all;
end


