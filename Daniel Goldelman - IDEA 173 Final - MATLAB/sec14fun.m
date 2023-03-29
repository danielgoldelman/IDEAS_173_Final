function [comment, prob, per_error] = sec14fun(pts,tr)
    if length(pts) ~= 7
        [comment,prob,per_error] = buildHead(14,7,pts);
    else 
        prob = "";
        [real_error,per_error] = buildError(pts,tr,7);
        
        comment = buildMult(1,2," first ","two quarter",real_error);
        
        comment = comment + buildMult(3,6,"","sixteenth",real_error);

        comment = comment + buildSingle(7,"last"," quarter",real_error);
        
    end
end
    