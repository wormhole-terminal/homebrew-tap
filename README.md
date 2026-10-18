# Wormhole's Homebrew tap

```sh
brew install --cask wormhole-terminal/tap/wormhole-terminal
brew install wormhole-terminal/tap/ttystorm
```

| Cask | What |
|---|---|
| [`wormhole-terminal`](https://getwormhole.app) | Wormhole, the terminal for working with AI coding agents (macOS 14+, Apple Silicon and Intel). It updates itself, so `brew upgrade` leaves it alone unless `--greedy`. Named `wormhole-terminal` because Homebrew's own `wormhole` cask is another app. |

| Formula | What |
|---|---|
| [`ttystorm`](https://github.com/wormhole-terminal/ttystorm) | stress tests, benchmarks and full-screen animations for any terminal, each a command of its own (`matrix`, `doomfire`, `logflood`, `roundtrip`, …) |

A new Wormhole release updates `version` and `sha256` in `Casks/wormhole-terminal.rb` by itself (the
Release workflow, with the `HOMEBREW_TAP_TOKEN` secret); without the secret, change them by hand to the
release's `Wormhole-X.Y.Z-macos.dmg` line in `SHA256SUMS`.

A new ttystorm version is a `vX.Y.Z` tag in
[wormhole-terminal/ttystorm](https://github.com/wormhole-terminal/ttystorm); then update `url` and
`sha256` in `Formula/ttystorm.rb`.
