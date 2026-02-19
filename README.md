# When Should We Bet? Data-Driven Betting Decisions in MLB

**TL;DR:** Built a supervised learning pipeline to predict win probabilities from pre-game features and used it to derive a betting decision rule (bet only when the model’s edge exceeds a threshold), with careful evaluation to avoid leakage.

## Goal
Turn historical MLB game data (and pre-game odds) into a model that estimates win probability **before** the game starts, then translate those probabilities into actionable betting decisions.

## Approach
- Feature engineering using only information available pre-game (rolling team form, pitcher trends, season-to-date stats).
- Linked games to odds data (moneyline) and converted odds to implied probabilities.
- Trained and compared baseline and interpretable models; evaluated with proper splits to prevent leakage.

## Outcome
- Produced a calibrated win-probability model and a practical “bet / no-bet” rule based on estimated edge vs the sportsbook implied probability.
- Summarized findings and limitations in the project report.

## Report
- Portfolio PDF: https://cesar-dx.github.io/assets/reports/ml.pdf

## Repo structure (planned)
- `src/` core pipeline code
- `notebooks/` experiments + analysis
- `data/` (not included) + instructions
- `figures/` plots

## Notes on data
Raw datasets are not included. This repo documents expected inputs and how to reproduce the pipeline.
