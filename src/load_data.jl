database = joinpath("..", "Data")
years = [2019, 2020, 2021, 2022, 2023, 2024, 2025]

dfs = DataFrame[]

for yearid in years
    datadir = joinpath(database, string(yearid))
    thisyear = DataFrame(CSV.File(joinpath(datadir, "final_format.csv")))
    thisyear.home_odds = string.(thisyear.home_odds)
    thisyear.away_odds = string.(thisyear.away_odds)
    push!(dfs, thisyear)
end

fullset = dfs[1]
for i = 2:length(dfs)
    fullset = vcat(fullset, dfs[i])
end

# (This line is unused downstream; keep only if you need to inspect one year)
thisyear = DataFrame(CSV.File(joinpath(database, string(2022), "final_format.csv")));