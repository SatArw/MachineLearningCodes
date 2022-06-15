function p = predict(Theta1, Theta2, X)
%PREDICT Predict the label of an input given a trained neural network
%   p = PREDICT(Theta1, Theta2, X) outputs the predicted label of X given the
%   trained weights of a neural network (Theta1, Theta2)

% Useful values
m = size(X, 1);
num_labels = size(Theta2, 1);   

% You need to return the following variables correctly 
p = zeros(size(X, 1), 1);

% X with bias
X_bias = zeros(size(X,1),size(X,2)+1);
X_bias(:,1) = 1;
for i = 2:size(X_bias,2)
    X_bias(:,i) = X(:,i-1);
end

%First layer mult
a = X_bias*transpose(Theta1);
a = sigmoid(a);

%a with bias
a_new = zeros(size(a,1),size(a,2)+1);
a_new(:,1) = 1;
for i = 2:size(a_new,2)
    a_new(:,i) = a(:,i-1);
end

%2nd layer mult
probs = a_new * transpose(Theta2);
for i = 1:size(p)
    [M,I] = max(probs(i,:));
    p(i) = I;
end

% ====================== YOUR CODE HERE ======================
% Instructions: Complete the following code to make predictions using
%               your learned neural network. You should set p to a 
%               vector containing labels between 1 to num_labels.
%
% Hint: The max function might come in useful. In particular, the max
%       function can also return the index of the max element, for more
%       information see 'help max'. If your examples are in rows, then, you
%       can use max(A, [], 2) to obtain the max for each row.
%









% =========================================================================


end
