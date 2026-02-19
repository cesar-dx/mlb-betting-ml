seed = 15095
(X_train, y_train), (X_valid, y_valid) = IAI.split_data(
    :classification, featurestraining, winnertraining, seed=seed, train_proportion=0.7
)

maxDepths = [2, 4, 6]
minBuckets = [20, 50, 100, 200]

grid = IAI.GridSearch(
    IAI.OptimalTreeClassifier(random_seed=seed, criterion=:gini),
    max_depth=maxDepths,
    minbucket=minBuckets,
    validation_criterion=:misclassification
)

IAI.fit!(grid, X_train, y_train, X_valid, y_valid)

best_params = IAI.get_learner(grid)
val_score = IAI.score(grid, featurestraining, winnertraining, criterion=:misclassification)
test_score = IAI.score(grid, featurestesting, winnertest, criterion=:misclassification)

best_params
println("Validation score (misclassification): ", val_score)
println("Test score (misclassification): ", test_score)