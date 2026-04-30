# node/bun-dual-lockfiles

**Detection:** single manager (bun) with two lockfile names — `same_manager` shape

**Expected MT outcome:** Auto-resolve: keep `bun.lock`, delete `bun.lockb` (no user prompt)
