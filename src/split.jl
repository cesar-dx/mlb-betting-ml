# mode 1 = split training at the beginning of a year and test at the end
# mode 2 = split years up to yr are training; all later are test
mode = 2
yr = 2023

if mode == 1
    trainset = fullset[(Dates.Year.(fullset.game_date) .== Dates.Year(yr)) .&
                       (Dates.month.(fullset.game_date) .< 8), :]
    testset  = fullset[(Dates.Year.(fullset.game_date) .== Dates.Year(yr)) .&
                       (Dates.month.(fullset.game_date) .>= 8), :]
elseif mode == 2
    trainset = fullset[(Dates.Year.(fullset.game_date) .<= Dates.Year(yr)), :]
    testset  = fullset[(Dates.Year.(fullset.game_date) .>  Dates.Year(yr)), :]
end