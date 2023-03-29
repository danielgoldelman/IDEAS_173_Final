function [comment, prob, per_error] = sec12fun_D1(pts,tr)
    if length(pts) > 5
        prob = "You played an extra note in measure 12!\n";
        comment = "Null\n";
        per_error = 0;
    elseif length(pts) < 5
        prob = "You missed a note in measure 12!\n";
        comment = "Null\n";
        per_error = 0;
    else 
        prob = "";
        for i=1:length(pts)
            real_error(i) = ((tr(i)-pts(i))/tr(i))*100;
        end

        if mean(real_error(1:4), "all") < -5
            comment = "Play the eighth notes a bit slower.\n";
        elseif mean(real_error(1:4), "all") > 5
            comment = "Play the eighth notes a bit faster.\n";
        else 
            comment = "";
        end

        if real_error(5) < -5
            comment = comment + "Hit the first half note a bit later.\n";
        elseif real_error(5) > 5
            comment = comment + "Hit the first half note a bit sooner.\n";
        else 
            comment = comment + "";
        end
        
        per_error = 0;
        for i=1:length(real_error)
            per_error = per_error + abs(real_error(i));
        end
        
        per_error = per_error/5;
    end

    
    
    