# swift/all-three

**Detection:** all three config files present (Package.swift, Podfile, Cartfile)

**Expected MT outcome:** Keep `Package.resolved` (SPM, top KB priority); delete `Podfile.lock` and `Cartfile.resolved`
