#!/usr/bin/env julia

# Always resolve paths from the repo root
const ROOT = normpath(joinpath(@__DIR__, ".."))

include(joinpath(ROOT, "src", "deps.jl"))

println("▶ Loading data...")
include(joinpath(ROOT, "src", "load_data.jl"))

println("▶ Cleaning data...")
include(joinpath(ROOT, "src", "cleaning.jl"))

println("▶ Engineering odds features...")
include(joinpath(ROOT, "src", "odds_features.jl"))

println("▶ Splitting train/test...")
include(joinpath(ROOT, "src", "split.jl"))

println("▶ Training GLM probit + threshold tuning...")
include(joinpath(ROOT, "src", "models", "glm_probit.jl"))

println("✅ Done.")