function A = moving_average_angle(v,ww,ws)
%% A = moving_average(M,ww,ws)
% the function calculates a moving average (A) for the angle vektor (v) (rad)
% with the window width (ww)
% with the window step (ws)
%  length(A) = length(v)-ww

N = length(v);

A = nan(1,round((N)/ws));

if(N > ww)
    for i = 1:length(A)
      if((ww+(i-1)*ws)<=length(v))
        A(i) = mean_angle(v((1:ww)+(i-1)*ws)); 
      end
    end
else
    disp('window width is larger than vector length')
end

end
