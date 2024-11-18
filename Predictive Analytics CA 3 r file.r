library(caret)
library(e1071)
library(rpart)
library(class)
library(ggplot2)

diabetes_data <- read.csv(file.choose())
View(diabetes_data)
str(diabetes_data)
summary(diabetes_data)
sum(is.na(diabetes_data))
preprocess_params <- preProcess(diabetes_data[, -ncol(diabetes_data)], method = c("center", "scale"))
diabetes_data_scaled <- predict(preprocess_params, diabetes_data)
set.seed(123)
train_index <- createDataPartition(diabetes_data_scaled$Outcome, p = 0.8, list = FALSE)
train_data <- diabetes_data_scaled[train_index, ]
test_data <- diabetes_data_scaled[-train_index, ]
knn_predictions <- knn(train = train_data[, -ncol(train_data)], 
                       test = test_data[, -ncol(test_data)], 
                       cl = train_data$Outcome, 
                       k = 5)

knn_accuracy <- sum(knn_predictions == test_data$Outcome) / nrow(test_data)
print(paste("KNN Accuracy:", round(knn_accuracy, 2)))

nb_model <- naiveBayes(Outcome ~ ., data = train_data)
nb_predictions <- predict(nb_model, test_data)

nb_accuracy <- sum(nb_predictions == test_data$Outcome) / nrow(test_data)
print(paste("Naive Bayes Accuracy:", round(nb_accuracy, 2)))

dt_model <- rpart(Outcome ~ ., data = train_data, method = "class")
dt_predictions <- predict(dt_model, test_data, type = "class")

dt_accuracy <- sum(dt_predictions == test_data$Outcome) / nrow(test_data)
print(paste("Decision Tree Accuracy:", round(dt_accuracy, 2)))

log_reg_model <- glm(Outcome ~ ., data = train_data, family = binomial)
log_reg_predictions <- ifelse(predict(log_reg_model, test_data, type = "response") > 0.5, 1, 0)

log_reg_accuracy <- sum(log_reg_predictions == test_data$Outcome) / nrow(test_data)
print(paste("Logistic Regression Accuracy:", round(log_reg_accuracy, 2)))


accuracy_df <- data.frame(
  Model = c("KNN", "Naive Bayes", "Decision Tree", "Logistic Regression"),
  Accuracy = c(knn_accuracy, nb_accuracy, dt_accuracy, log_reg_accuracy)
)

ggplot(accuracy_df, aes(x = Model, y = Accuracy, fill = Model)) +
  geom_bar(stat = "identity") +
  theme_minimal() +
  ggtitle("Comparison of Model Accuracies") +
  ylab("Accuracy") +
  xlab("Model")