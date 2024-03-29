clear all;
a = arduino();
x=serial('COM18','BAUD', 9600);
dataset=fopen(x)
for i=1:3000
    dataset=fopen(x)
    dataset=[dataset ans];
end

training_class_name = dataset(1:2800,3:3);
training_data = dataset(1:2800,1:2);
validating_class_names = dataset(2801:3000,3:3);
validating_data = dataset(2801:3000,1:2);

% getting the svm model using fitcsvm function
SVM_model=fitcsvm(training_data,training_class_name);

% predicting the class names and also the score 
[predicted_class_name,score] = predict(SVM_model,validating_data);  

 % checking the accuracy 
 accuracy = sum(predicted_class_name == validating_class_names)/numel(validating_class_names)
 % confusion chart is added
 cm = confusionchart(validating_class_names,predicted_class_name);
 mean_square_error=mean((validating_class_names-predicted_class_name).^2)
