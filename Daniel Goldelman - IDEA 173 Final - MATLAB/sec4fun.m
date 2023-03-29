function [comment, prob, per_error] = sec4fun(pts,tr)
    if length(pts) ~= 9
        [comment,prob,per_error] = buildHead(4,9,pts);
    else 
        prob = "";
        [real_error,per_error] = buildError(pts,tr,9);
        
        comment = buildMult(1,4,"","eighth",real_error);

        comment = comment + buildMult(5,8,"","16th",real_error);
    end
end