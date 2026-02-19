fm = @formula(home_winner ~ home_last5_o_hardhit_diff + home_last5_o_launch_angle + home_last5_o_launch_speed_diff +
                            home_last5_o_xwoba_diff + home_last_p_hardhit_diff + home_last_p_launch_angle + home_last_p_launch_speed_diff +
                            home_last_p_xwoba_diff + away_last5_o_launch_angle +
                            away_last_p_launch_angle + favouritefactor + home_win_pct_to_date +
                            away_win_pct_to_date)

logit = glm(fm, trainset, Binomial(), ProbitLink())

# Retrain with only significant to 95% (your reduced model)
fm = @formula(home_winner ~ home_last5_o_launch_angle +
                            home_last_p_launch_speed_diff +
                            favouritefactor +
                            home_win_pct_to_date + away_win_pct_to_date)

logit = glm(fm, trainset, Binomial(), ProbitLink())

# Tune threshold on training
pred_train = predict(logit, trainset)
accs = Float64[]
rocs = 0.1:0.01:0.9

for roc in rocs
    homewins = pred_train .>= roc
    mean_accuracy = mean(trainset.home_winner .== Int.(homewins))
    push!(accs, mean_accuracy)
end

println("Best Training set Accuracy: " * string(maximum(accs)))
bestroc = rocs[argmax(accs)]

# Test evaluation
pred_test = predict(logit, testset)
homewins = pred_test .>= bestroc
mean_accuracy = mean(testset.home_winner .== Int.(homewins))
println("Test Accuracy: " * string(mean_accuracy))