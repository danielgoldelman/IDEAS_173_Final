function [comment, prob, per_error] = sec2fun(pts,tr)
    if length(pts) ~= 6
        [comment,prob,per_error] = buildHead(2,6,pts);
    else 
        prob = "";
        [real_error,per_error] = buildError(pts,tr,6);

        comment = buildSingle(1,"first","quarter",real_error);

        comment = comment + buildSingle(2,"second","quarter",real_error);

        comment = comment + buildMult(3,6,"","eighth",real_error); 
    end
end