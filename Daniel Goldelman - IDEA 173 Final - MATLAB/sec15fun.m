function [comment, prob, per_error] = sec15fun(pts,tr)
    if length(pts) ~= 10
        [comment,prob,per_error] = buildHead(15,10,pts);
    else 
        prob = "";
        [real_error,per_error] = buildError(pts,tr,10);
        
        comment = buildSingle(1,"first","quarter",real_error);
        
        comment = comment + buildMult(2,5," first ", "set of sixteenth", real_error);
        
        comment = comment + buildSingle(6,"second","quarter",real_error);
        
        comment = comment + buildMult(7,10,"second ", "set of sixteenth",real_error);
    
    end
end

   