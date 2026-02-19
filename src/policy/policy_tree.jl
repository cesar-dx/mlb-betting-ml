# Split policy dataset
mode = 2
yr = 2023

if mode == 1
    trainset = alldf[(Dates.Year.(alldf.game_date) .== Dates.Year(yr)) .&
                     (Dates.month.(alldf.game_date) .< 8), :]
    # NOTE: your notebook had a typo "fullsalldfet"
    testset  = alldf[(Dates.Year.(alldf.game_date) .== Dates.Year(yr)) .&
                     (Dates.month.(alldf.game_date) .>= 8), :]
elseif mode == 2
    trainset = alldf[(Dates.Year.(alldf.game_date) .<= Dates.Year(yr)), :]
    testset  = alldf[(Dates.Year.(alldf.game_date) .>  Dates.Year(yr)), :]
end

# This is how you were reconstructing the per-game height
ogheight = Int(size(fullset, 1) * (size(trainset, 1) / size(alldf, 1)))

reward_lnr = IAI.NumericRegressionRewardEstimator(
    propensity_estimator=IAI.RandomForestRegressor(),
    outcome_estimator=IAI.RandomForestRegressor(),
    reward_estimator=:doubly_robust,
    propensity_min_value=0.1,
    random_seed=seed,
)

train_predictions, train_reward_score = IAI.fit_predict!(
    reward_lnr, trainset[!, features], trainset[!, :bet], trainset[!, :return], bets
)
train_rewards = train_predictions[!, :reward]

grid = IAI.GridSearch(
    IAI.OptimalTreePolicyMaximizer(random_seed=seed),
    max_depth=maxDepths,
    minbucket=minBuckets
)
IAI.fit!(grid, trainset[!, features], train_rewards)

# NOTE: your notebook references `test_bets` but the line that creates it is commented out.
# You need to uncomment and decide which rows of testset correspond to the "original" games.
# test_bets = IAI.predict(grid, testset[1:(ogheight - 1), features])