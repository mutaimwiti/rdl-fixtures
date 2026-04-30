# remove-duplicate-lockfiles fixtures

Test fixtures for the **`remove_duplicate_lockfiles_<eco>`** maintenance task family.

Each subdirectory under `node/`, `python/`, `ruby/`, `go/`, `swift/`, `dotnet/`, `haskell/`, `cpp/`, `jvm/`, and `beam/` is a self-contained scenario that exercises one branch of the corresponding ecosystem MT's detection / resolution logic. Running an ecosystem MT against this repo produces one recommendation per qualifying conflict directory.

## Running an MT against this repo

In Iris / Autar:

1. Add `https://github.com/mutaimwiti/mt-fixtures` as the project under analysis.
2. Pick the relevant `remove_duplicate_lockfiles_<eco>` MT.
3. Each scenario folder's expected behaviour is documented below.

## Node (10 scenarios)

| Folder | Detection | Expected outcome |
|---|---|---|
| `node/packagemanager-pnpm/` | `packageManager: pnpm` in package.json | Keep `pnpm-lock.yaml`, delete others |
| `node/packagemanager-yarn-berry/` | `packageManager: yarn@4` in package.json | Keep `yarn.lock`, delete others |
| `node/packagemanager-npm/` | `packageManager: npm@10` in package.json | Keep `package-lock.json`, delete others |
| `node/config-yarn/` | `.yarnrc.yml` present | Keep `yarn.lock`, delete others |
| `node/config-pnpm-workspace/` | `pnpm-workspace.yaml` present | Keep `pnpm-lock.yaml`, delete others |
| `node/ambiguous/` | no signals | User prompt |
| `node/bun-dual-lockfiles/` | bun.lock + bun.lockb same-manager | Keep `bun.lock` (auto, no prompt) |
| `node/bun-vs-yarn-detected/` | `packageManager: bun` in package.json | Keep `bun.lock`, delete others |
| `node/deno-vs-npm/` | `deno.json` present | Keep `deno.lock`, delete others |
| `node/no-conflict/` | single lockfile | MT should not surface |

## Python (8 scenarios)

| Folder | Detection | Expected outcome |
|---|---|---|
| `python/tool-uv/` | `[tool.uv]` in pyproject.toml | Keep `uv.lock`, delete others |
| `python/tool-poetry/` | `[tool.poetry]` in pyproject.toml | Keep `poetry.lock`, delete others |
| `python/tool-pdm/` | `[tool.pdm]` in pyproject.toml | Keep `pdm.lock`, delete others |
| `python/pipfile/` | `Pipfile` present | Keep `Pipfile.lock`, delete others |
| `python/pixi-vs-uv/` | `pixi.toml` present | Keep `pixi.lock`, delete others |
| `python/ambiguous/` | no signals | User prompt |
| `python/tool-uv-vs-pipfile/` | both `[tool.uv]` AND `Pipfile` present | Pyproject wins → keep `uv.lock` |
| `python/no-conflict/` | single lockfile | MT should not surface |

## Ruby (2 scenarios)

| Folder | Detection | Expected outcome |
|---|---|---|
| `ruby/bundler-same-manager/` | bundler with `Gemfile.lock` + `gems.locked` (same-manager) | Auto: keep `Gemfile.lock`, delete `gems.locked` |
| `ruby/no-conflict/` | single lockfile | MT should not surface |

## Go (5 scenarios)

| Folder | Detection | Expected outcome |
|---|---|---|
| `go/go-modules-vs-dep/` | `go.mod` + `Gopkg.toml` both present | Keep `go.sum` (modules wins) |
| `go/go-modules-vs-glide/` | `go.mod` + `glide.yaml` both present | Keep `go.sum` (modules wins) |
| `go/dep-vs-glide/` | `Gopkg.toml` + `glide.yaml`, no `go.mod` | Keep `Gopkg.lock` (dep wins) |
| `go/ambiguous/` | no config files | User prompt |
| `go/no-conflict/` | single lockfile | MT should not surface |

## Swift / Apple (5 scenarios)

| Folder | Detection | Expected outcome |
|---|---|---|
| `swift/spm-detected/` | `Package.swift` + `Podfile` both present | Keep `Package.resolved` (SPM wins) |
| `swift/cocoapods-detected/` | `Podfile` + `Cartfile` both present (no Package.swift) | Keep `Podfile.lock` (CocoaPods wins) |
| `swift/all-three/` | all three config files | Keep `Package.resolved` (SPM, top priority) |
| `swift/ambiguous/` | no config files | User prompt |
| `swift/no-conflict/` | single lockfile | MT should not surface |

## .NET (3 scenarios)

| Folder | Detection | Expected outcome |
|---|---|---|
| `dotnet/paket-detected/` | `paket.dependencies` present | Keep `paket.lock`, delete `packages.lock.json` |
| `dotnet/nuget-ambiguous/` | no `paket.dependencies` (NuGet has no fingerprint) | User prompt |
| `dotnet/no-conflict/` | single lockfile | MT should not surface |

## Haskell (4 scenarios)

| Folder | Detection | Expected outcome |
|---|---|---|
| `haskell/cabal-detected/` | `cabal.project` present | Keep `cabal.project.freeze`, delete `stack.yaml.lock` |
| `haskell/stack-detected/` | `stack.yaml` present (no cabal.project) | Keep `stack.yaml.lock`, delete `cabal.project.freeze` |
| `haskell/ambiguous/` | no config files | User prompt |
| `haskell/no-conflict/` | single lockfile | MT should not surface |

## C/C++ (4 scenarios)

| Folder | Detection | Expected outcome |
|---|---|---|
| `cpp/conan-detected/` | `conanfile.txt` present | Keep `conan.lock`, delete `vcpkg-lock.json` |
| `cpp/vcpkg-detected/` | `vcpkg.json` present (no conanfile) | Keep `vcpkg-lock.json`, delete `conan.lock` |
| `cpp/ambiguous/` | no config files | User prompt |
| `cpp/no-conflict/` | single lockfile | MT should not surface |

## JVM (4 scenarios)

| Folder | Detection | Expected outcome |
|---|---|---|
| `jvm/gradle-detected/` | `build.gradle` + `build.sbt` both present | Keep `gradle.lockfile` (Gradle wins) |
| `jvm/sbt-detected/` | `build.sbt` + `project/plugins.sbt` (no build.gradle) | Keep `build.sbt.lock`, delete `gradle.lockfile` |
| `jvm/ambiguous/` | no config files | User prompt |
| `jvm/no-conflict/` | single lockfile | MT should not surface |

## BEAM / Erlang+Elixir (4 scenarios)

| Folder | Detection | Expected outcome |
|---|---|---|
| `beam/hex-detected/` | `mix.exs` + `rebar.config` both present | Keep `mix.lock` (Hex/Mix wins) |
| `beam/rebar3-detected/` | `rebar.config` present (no mix.exs) | Keep `rebar.lock`, delete `mix.lock` |
| `beam/ambiguous/` | no config files | User prompt |
| `beam/no-conflict/` | single lockfile | MT should not surface |

## Notes

- Lockfile files are intentionally **empty** — the MT's scanner only checks filenames, not contents.
- Config files (`package.json`, `pyproject.toml`, `Pipfile`, `Cartfile`, `mix.exs`, etc.) carry the minimum content the detector inspects.
- Ecosystems whose MTs haven't yet shipped (Ruby, Go, Swift, .NET, Haskell, C++, JVM, BEAM) have fixtures pre-staged so the repo is forward-stocked for the entire series.
- Updated as the remaining MTs ship; see Notion task 1053.
