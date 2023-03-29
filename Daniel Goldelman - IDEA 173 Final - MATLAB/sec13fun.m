function [comment, prob, per_error] = sec13fun(pts,tr)
    if length(pts) ~= 10
        [comment,prob,per_error] = buildHead(13,10,pts);
    else 
        prob = "";
        [real_error,per_error] = buildError(pts,tr,10);
        
        comment = buildMult(1,4," first ","set of sixteenth", real_error);
        
        comment = comment + buildSingle(5,"first","quarter",real_error);

        comment = comment + buildMult(6,9,"second ", "set of sixteenth", real_error);

        comment = comment + buildSingle(10,"second ","quarter",real_error);
        
    end
end

