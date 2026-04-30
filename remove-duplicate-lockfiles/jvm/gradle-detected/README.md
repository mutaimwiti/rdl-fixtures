# jvm/gradle-detected

**Detection:** `build.gradle` + `build.sbt` both present — Gradle wins by KB priority

**Expected MT outcome:** Keep `gradle.lockfile`, delete `build.sbt.lock`
