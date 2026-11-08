# mh-mobile/homebrew-tap

Homebrew tap for [RoamRun](https://github.com/mh-mobile/RoamRun) and [Reqcove](https://github.com/mh-mobile/reqcove).

```sh
brew install --cask mh-mobile/tap/roamrun
```

`roamrunctl`, for a machine that has no RoamRun (a Mac, or Linux with Homebrew), is built from source:

```sh
brew install mh-mobile/tap/roamrunctl
```

RoamRun is signed with a Developer ID and notarized: it opens without a warning.

## Reqcove

Reqcove hands an iPhone's HTTP(S) traffic to an AI agent over MCP. It is built
from source and brings uv, which fetches mitmproxy on the first run:

```sh
brew install mh-mobile/tap/reqcove
```
