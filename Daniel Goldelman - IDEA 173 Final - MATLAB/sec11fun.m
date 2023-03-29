function [comment, prob, per_error] = sec11fun(pts,tr)
    if length(pts) ~= 4
        [comment,prob,per_error] = buildHead(11,4,pts);
    else 
        prob = "";
        [real_error,per_error] = buildError(pts,tr,4);
        
        comment = buildMult(1,4,"","quarter",real_error);
        
    end
end