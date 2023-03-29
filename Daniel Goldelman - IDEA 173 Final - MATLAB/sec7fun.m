function [comment, prob, per_error] = sec7fun(pts,tr)
    if length(pts) ~= 3
        [comment,prob,per_error] = buildHead(7,3,pts);
    else 
        prob = "";
        [real_error,per_error] = buildError(pts,tr,3);
        
        comment = buildSingle(1,"","half",real_error);
        
        comment = comment + buildMult(2,3,"","quarter",real_error);
       
    end
end