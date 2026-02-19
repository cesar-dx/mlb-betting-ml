# Requires `res` with columns: game_date, pred_bet, return
column_names = ["Date", "Bank", "Amt_Wagered", "Daily_Profit"]
budgetdf = DataFrame([name => [] for name in column_names])

todaydate = Date(2024, 1, 1)
budget = 2000

while Dates.Year(todaydate) <= Dates.Year(2025)
    todayset = res[res.game_date .== todaydate, :]

    wagered = sum(abs.(todayset.pred_bet))
    profit  = sum(todayset.return)

    push!(budgetdf, [todaydate, budget, wagered, profit])

    budget += profit
    todaydate += Dates.Day(1)
end

plot(budgetdf.Date, budgetdf.Bank)