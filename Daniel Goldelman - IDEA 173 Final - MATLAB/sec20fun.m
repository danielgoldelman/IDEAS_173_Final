function [comment, prob, per_error] = sec20fun(pts,tr)
    if length(pts) ~= 3
        [comment,prob,per_error] = buildHead(20,3,pts);
    else 
        prob = "";
        [real_error,per_error] = buildError(pts,tr,3);
        
        comment = buildSingle(1,"first","quarter",real_error);

        comment = comment + buildSingle(2,"second","quarter",real_error);

        comment = comment + buildSingle(3,"","half",real_error);

    end
end

