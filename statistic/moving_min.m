function A = moving_min(v,ww,ws)
%% A = moving_min(M,ww,ws)
% the function calculates a moving minimum (A) for the vektor (v)
% with the window width (ww)
% with the window step (ws)
%  length(A) = length(v)-ww

N = length(v);

A = nan(1,round((N)/ws));

if(N > ww)
    for i = 1:length(A)
      if((ww+(i-1)*ws)<=length(v))
        A(i) = nanmin(v((1:ww)+(i-1)*ws)); 
      end
    end
else
    disp('window width is larger than vector length')
end

end
