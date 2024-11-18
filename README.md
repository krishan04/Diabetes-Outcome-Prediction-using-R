# Diabetes-Outcome-Prediction-using-R

## Project Overview
This project aims to develop and compare multiple predictive models using a diabetes dataset. It involves data preprocessing, exploratory data analysis (EDA), and applying machine learning algorithms to predict diabetes outcomes. The models implemented include k-Nearest Neighbors (k-NN), Naive Bayes, Logistic Regression, and Decision Tree. The performance of each model is evaluated and compared based on accuracy.

##Prerequisites
The following R packages are required for this project:

  -caret
  
  -e1071
  
  -rpart
  
  -class
  
  -ggplot2

## Steps in the Analysis
### Data Loading:
The dataset is loaded using file.choose(), allowing the user to select a CSV file manually.

### Data Inspection:
Displays the structure and summary statistics of the dataset.
Checks for missing values.

### Data Preprocessing:
Centers and scales the dataset using preProcess() from the caret package.
Handles any potential data imbalances and missing values.

### Train-Test Split:
Splits the dataset into training (80%) and testing (20%) subsets using createDataPartition().

### Model Building:
The following models are implemented:
   -k-Nearest Neighbors (k-NN): A simple, instance-based learning algorithm.
   
   -Naive Bayes: A probabilistic classifier based on Bayes' theorem.
   
   -Logistic Regression: A statistical model used for binary classification.
   
   -Decision Tree: A tree-based model that makes predictions based on feature splits.
   
### Model Evaluation and Comparison:
Evaluates each model's performance using metrics such as accuracy.
Compares the accuracies of all models to determine the best-performing one.

