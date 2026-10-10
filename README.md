# mh-mobile/homebrew-tap

Homebrew tap for [RoamRun](https://github.com/mh-mobile/RoamRun).

```sh
brew install --cask mh-mobile/tap/roamrun
```

`roamrunctl`, for a machine that has no RoamRun (a Mac, or Linux with Homebrew), is built from source:

```sh
brew install mh-mobile/tap/roamrunctl
```

RoamRun is not notarized, so macOS blocks it on first launch (not after `brew upgrade`):
open it once, then allow it in **System Settings → Privacy & Security → Open Anyway**.
