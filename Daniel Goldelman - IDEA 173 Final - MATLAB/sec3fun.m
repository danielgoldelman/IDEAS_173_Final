function [comment, prob, per_error] = sec3fun(pts,tr)
    if length(pts) ~= 2
        [comment,prob,per_error] = buildHead(3,2,pts);
    else 
        prob = "";
        [real_error, per_error] = buildError(pts,tr,2);
        
        comment = buildSingle(1,"first","half",real_error);
        
        comment = comment + buildSingle(2,"second","half",real_error);
    end 
end