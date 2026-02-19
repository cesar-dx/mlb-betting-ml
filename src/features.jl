features = [:home_id, :home_last5_o_hardhit_diff, :home_last5_o_launch_angle, :home_last5_o_launch_speed_diff,
            :home_last5_o_xwoba_diff, :home_last_p_hardhit_diff, :home_last_p_launch_angle, :home_last_p_launch_speed_diff,
            :home_last_p_xwoba_diff, :away_id, :away_last5_o_launch_angle, :away_last_p_launch_angle,
            :favouritefactor, :home_win_pct_to_date, :away_win_pct_to_date]

featurestraining = trainset[!, features]
featurestesting  = testset[!, features]

winnertraining = trainset.home_winner
winnertest     = testset.home_winner