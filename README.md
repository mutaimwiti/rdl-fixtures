# mt-fixtures

Test fixtures for autar's **maintenance task** (MT) families. One folder per family.

## Layout

```
mt-fixtures/
└── remove-duplicate-lockfiles/   # Fixtures for the remove_duplicate_lockfiles_<eco> family
    ├── node/      python/      ruby/       go/         swift/
    ├── dotnet/    haskell/     cpp/        jvm/        beam/
    └── README.md
```

Each family folder contains scenario subdirectories; the family's README documents detection signals and expected outcomes per scenario.

## Adding a new MT family

1. Create `<family-name>/` at the repo root.
2. Add scenario subdirectories with the minimum config needed to trigger the MT.
3. Add a `README.md` documenting per-scenario expected behaviour.
4. (Optional) Add corresponding harness folder in [`mt-e2e`](https://github.com/mutaimwiti/mt-e2e) for automated testing.

## Running an MT against this repo

In Iris / Autar:

1. Add `https://github.com/mutaimwiti/mt-fixtures` as the project under analysis.
2. Pick the relevant MT.
3. Each family folder's README documents expected behaviour per scenario.
