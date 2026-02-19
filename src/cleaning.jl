fullset.home_odds = replace(fullset.home_odds, "-" => missing)
fullset.home_odds = replace(fullset.home_odds, "missing" => missing)
fullset.away_odds = replace(fullset.away_odds, "-" => missing)
fullset.away_odds = replace(fullset.away_odds, "missing" => missing)

dropmissing!(fullset)
filter!(row -> all(x -> !(x isa Number && isnan(x)), row), fullset)