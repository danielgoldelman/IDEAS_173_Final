function [comment, prob, per_error] = sec19fun(pts,tr)
    if length(pts) ~= 8
        [comment,prob,per_error] = buildHead(19,8,pts);
    else 
        prob = "";
        [real_error,per_error] = buildError(pts,tr,8);
        
        comment = buildMult(1,3," first ", "set of triplets",real_error);
         
        comment = comment + buildSingle(4,"first","quarter",real_error);

        comment = comment + buildMult(5,7," second ", "set of triplets",real_error);

        comment = comment + buildSingle(8,"second","quarter",real_error);
       
    end
end

    