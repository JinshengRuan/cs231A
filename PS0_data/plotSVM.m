function plotSVM(data, labels, model)
% PLOT DATA AND SVM DECISION BOUNDARY GIVEN AN SVM MODEL

%extract (x,y) for pos/neg data
data_x_pos = data(labels==1,1);
data_y_pos = data(labels==1,2);
data_x_neg = data(labels==-1,1);
data_y_neg = data(labels==-1,2);

%plot data and svm decision boundary
figure
scatter(data_x_pos, data_y_pos,'r+')
hold on
scatter(data_x_neg, data_y_neg,'bx')
t = linspace(min([data_x_pos; data_x_neg]), max([data_x_pos; data_x_neg]));

% Check for bias
if numel(model.w) == 3
  y = (-model.w(1)*t - model.w(3)) / model.w(2);
else
  y = -model.w(1)*t/model.w(2);
end
plot(t,y,'k')
