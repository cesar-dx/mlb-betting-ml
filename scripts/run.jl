#!/usr/bin/env julia
# Entry point to run the MLB betting pipeline end-to-end.
# Run from repo root:
#   julia --project=. scripts/run.jl

# Load dependencies first
include(joinpath("src", "deps.jl"))

println("▶ Loading data...")
include(joinpath("src", "load_data.jl"))

println("▶ Cleaning data...")
include(joinpath("src", "cleaning.jl"))

println("▶ Engineering odds features...")
include(joinpath("src", "odds_features.jl"))

println("▶ Splitting train/test...")
include(joinpath("src", "split.jl"))

println("▶ Training GLM probit + threshold tuning...")
include(joinpath("src", "models", "glm_probit.jl"))

# Optional sections (uncomment if you have IAI installed and want to run them)
# println("▶ Defining feature matrices...")
# include(joinpath("src", "features.jl"))

# println("▶ Training OCT (IAI)...")
# include(joinpath("src", "models", "oct.jl"))

# println("▶ Building treatment dataset...")
# include(joinpath("src", "policy", "build_treatments.jl"))

# println("▶ Training policy tree (IAI)...")
# include(joinpath("src", "policy", "policy_tree.jl"))

println("✅ Done.")