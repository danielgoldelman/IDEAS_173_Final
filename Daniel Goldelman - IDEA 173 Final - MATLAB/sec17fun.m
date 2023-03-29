function [comment, prob, per_error] = sec17fun(pts,tr)
    if length(pts) ~= 16
        [comment,prob,per_error] = buildHead(17,16,pts);
    else 
        prob = "";
        [real_error,per_error] = buildError(pts,tr,16);
        
        comment = buildMult(1,4,"first ", "set of sixteenth", real_error);
        
        comment = comment + buildMult(5,8,"second ", "set of sixteenth",real_error);

        comment = comment + buildMult(9,12,"third ", "set of sixteenth",real_error);

        comment = comment + buildMult(13,16,"fourth ","set of sixteenth",real_error);
    end
end