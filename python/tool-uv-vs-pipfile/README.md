# python/tool-uv-vs-pipfile

**Detection:** BOTH `[tool.uv]` in pyproject.toml AND `Pipfile` present (priority test)

**Expected MT outcome:** pyproject takes precedence — keep `uv.lock`, delete `Pipfile.lock`
