# go/dep-vs-glide

**Detection:** `Gopkg.toml` + `glide.yaml` both present (no go.mod)

**Expected MT outcome:** Keep `Gopkg.lock`, delete `glide.lock`
