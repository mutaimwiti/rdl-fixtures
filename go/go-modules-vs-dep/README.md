# go/go-modules-vs-dep

**Detection:** `go.mod` + `Gopkg.toml` both present — first match (go_modules) wins by KB priority

**Expected MT outcome:** Keep `go.sum`, delete `Gopkg.lock`
