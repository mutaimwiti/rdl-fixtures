# ruby/bundler-same-manager

**Detection:** single manager (bundler) with two lockfile names — `same_manager` shape

**Expected MT outcome:** Auto-resolve: keep `Gemfile.lock`, delete `gems.locked` (no user prompt)
