# rdl-fixtures

Test repository for the **`remove_duplicate_lockfiles_<eco>`** maintenance task family.

Each subdirectory under `node/` and `python/` is a self-contained scenario that
exercises one branch of the task's detection / resolution logic. Running an
ecosystem MT against this repo produces one recommendation per conflict
directory.

## Running an MT against this repo

In Iris / Autar:
1. Add `https://github.com/mutaimwiti/rdl-fixtures` as the project under analysis.
2. Pick the `remove_duplicate_lockfiles_node` or `remove_duplicate_lockfiles_python` MT.
3. Each folder's expected behaviour is documented in its own README.

## Node scenarios (10)

| Folder | Detection | Expected outcome |
|---|---|---|
| `node/packagemanager-pnpm/` | `packageManager: pnpm` in package.json | Keep `pnpm-lock.yaml`, delete others |
| `node/packagemanager-yarn-berry/` | `packageManager: yarn@4` in package.json | Keep `yarn.lock`, delete others |
| `node/packagemanager-npm/` | `packageManager: npm@10` in package.json | Keep `package-lock.json`, delete others |
| `node/config-yarn/` | `.yarnrc.yml` present | Keep `yarn.lock`, delete others |
| `node/config-pnpm-workspace/` | `pnpm-workspace.yaml` present | Keep `pnpm-lock.yaml`, delete others |
| `node/ambiguous/` | no signals | Surface user prompt |
| `node/bun-dual-lockfiles/` | bun.lock + bun.lockb same-manager | Keep `bun.lock` (auto, no prompt) |
| `node/bun-vs-yarn-detected/` | `packageManager: bun` in package.json | Keep `bun.lock`, delete others |
| `node/deno-vs-npm/` | `deno.json` present | Keep `deno.lock`, delete others |
| `node/no-conflict/` | single lockfile | MT should not surface |

## Python scenarios (8)

| Folder | Detection | Expected outcome |
|---|---|---|
| `python/tool-uv/` | `[tool.uv]` in pyproject.toml | Keep `uv.lock`, delete others |
| `python/tool-poetry/` | `[tool.poetry]` in pyproject.toml | Keep `poetry.lock`, delete others |
| `python/tool-pdm/` | `[tool.pdm]` in pyproject.toml | Keep `pdm.lock`, delete others |
| `python/pipfile/` | `Pipfile` present | Keep `Pipfile.lock`, delete others |
| `python/pixi-vs-uv/` | `pixi.toml` present | Keep `pixi.lock`, delete others |
| `python/ambiguous/` | no signals | Surface user prompt |
| `python/tool-uv-vs-pipfile/` | both pyproject `[tool.uv]` AND `Pipfile` present | Pyproject wins → keep `uv.lock` |
| `python/no-conflict/` | single lockfile | MT should not surface |

## Notes

- Lockfile files are intentionally empty — the MT's scanner only checks filenames, not contents.
- Config files (`package.json`, `pyproject.toml`, `Pipfile`, etc.) carry the minimum content the detector inspects.
- The repo is updated as new ecosystem MTs ship; see Notion task 1053.
