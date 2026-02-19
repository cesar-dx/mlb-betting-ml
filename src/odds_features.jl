# Convert money line to Int
fullset.home_odds = parse.(Int, fullset.home_odds)
fullset.away_odds = parse.(Int, fullset.away_odds)

# Convert money line to multiplier
fullset.home_multiplier = (abs.(fullset.home_odds) ./ 100).^(sign.(fullset.home_odds))
fullset.away_multiplier = (abs.(fullset.away_odds) ./ 100).^(sign.(fullset.away_odds))

# favouritefactor = ratio away/home multipliers (higher => home more favoured)
fullset.favouritefactor = fullset.away_multiplier ./ fullset.home_multiplier