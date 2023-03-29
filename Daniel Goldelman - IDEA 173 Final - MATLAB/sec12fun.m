function [comment, prob, per_error] = sec12fun(pts,tr)
    if length(pts) ~= 5
        [comment,prob,per_error] = buildHead(12,5,pts);
    else 
        prob = "";
        [real_error,per_error] = buildError(pts,tr,5);
        
        comment = buildMult(1,4,"","eighth",real_error);

        comment = comment + buildSingle(5,"","half",real_error);
    end
end

    
    
    