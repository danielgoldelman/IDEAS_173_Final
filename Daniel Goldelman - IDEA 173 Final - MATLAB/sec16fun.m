function [comment, prob, per_error] = sec16fun(pts,tr)
    if length(pts) ~= 9
        [comment,prob,per_error] = buildHead(16,9,pts);
    else 
        prob = "";
        [real_error,per_error] = buildError(pts,tr,9);
        
        comment = buildMult(1,2," first ","set of eighth",real_error);

        comment = comment + buildMult(3,6,"","sixteenth",real_error);
        
        comment = comment + buildMult(7,8," second ", "set of eighth", real_error);

        comment = comment + buildSingle(9,"","quarter",real_error);

    end
end
