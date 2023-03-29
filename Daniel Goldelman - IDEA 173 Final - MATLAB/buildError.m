function [real_error, per_error] = buildError(pts,tr,num)
    for i=1:length(pts)
        real_error(i) = ((tr(i)-pts(i))/tr(i))*100;
    end
    
    per_error = 0;
    for i=1:length(real_error)
        per_error = per_error + abs(real_error(i));
    end
        
    per_error = per_error/num;
end