bets = [-100, -10, 0, 10, 100]
alldf = DataFrame()

for (i, bet) in enumerate(bets)
    betdf = copy(fullset)
    betdf.bet .= bet

    home_return = abs.(betdf.bet) .* (1 .+ betdf.home_multiplier)
    away_return = abs.(betdf.bet) .* (1 .+ betdf.away_multiplier)

    bet_home = bet > 0
    won_bet = .!(xor.(bet_home, betdf.home_winner))

    betdf.return = won_bet .* (bet_home .* home_return + .!bet_home .* away_return) .-
                   .!won_bet .* abs(bet)

    alldf = (i == 1) ? copy(betdf) : vcat(alldf, betdf)
end