function [bestEpsilon bestF1] = selectThreshold(yval, pval)
%SELECTTHRESHOLD Find the best threshold (epsilon) to use for selecting
%outliers
%   [bestEpsilon bestF1] = SELECTTHRESHOLD(yval, pval) finds the best
%   threshold to use for selecting outliers based on the results from a
%   validation set (pval) and the ground truth (yval).
%

bestEpsilon = 0;
bestF1 = 0;
F1 = 0;

stepsize = (max(pval) - min(pval)) / 1000;
for epsilon = min(pval):stepsize:max(pval)
    preps = zeros(size(pval));
    for i = 1:size(yval,1)
        if(pval(i)<epsilon)
            preps(i) = 1;
        end
    end
    eval_table = zeros(2,2);
    for i = 1:size(yval,1)
        if(preps(i)==1)
            if(preps(i)==yval(i))
                eval_table(1,1) = eval_table(1,1)+1;
            else
                eval_table(1,2) = eval_table(1,2)+1;
            end
        end
        if(preps(i)==0)
            if(preps(i)==yval(i))
                eval_table(2,2) = eval_table(2,2)+1;
            else
                eval_table(2,1) = eval_table(2,1)+1;
            end
        end
    end
    precision = eval_table(1,1)/(eval_table(1,1)+eval_table(1,2));
    recall = eval_table(1,1)/(eval_table(1,1)+eval_table(2,1));
    F1 = 2*precision*recall/(precision+recall);
  

        
           
    
    % ====================== YOUR CODE HERE ======================
    % Instructions: Compute the F1 score of choosing epsilon as the
    %               threshold and place the value in F1. The code at the
    %               end of the loop will compare the F1 score for this
    %               choice of epsilon and set it to be the best epsilon if
    %               it is better than the current choice of epsilon.
    %               
    % Note: You can use predictions = (pval < epsilon) to get a binary vector
    %       of 0's and 1's of the outlier predictions













    % =============================================================

    if F1 > bestF1
       bestF1 = F1;
       bestEpsilon = epsilon;
    end
end

end
