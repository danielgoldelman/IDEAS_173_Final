function [comment, prob, per_error] = sec8fun(pts,tr)
    if length(pts) ~= 4
        [comment,prob,per_error] = buildHead(8,4,pts);
    else 
        prob = "";
        [real_error,per_error] = buildError(pts,tr,4);
        
        comment = buildSingle(1,"","half",real_error);
        
        comment = comment + buildSingle(2,"","quarter",real_error);
        
        comment = comment + buildMult(3,4,"","eighth",real_error);
    end
end