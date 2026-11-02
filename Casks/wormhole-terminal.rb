cask "wormhole-terminal" do
  version "1.6.3"
  sha256 "96638acbd0ad278d5595688cddb8b81e524a3c6d403913e7b7afab85d089ab48"

  url "https://github.com/wormhole-terminal/wormhole/releases/download/v#{version}/Wormhole-#{version}-macos.dmg"
  name "Wormhole"
  desc "Fast native terminal with agent status, git and notes built in"
  homepage "https://getwormhole.app/"

  livecheck do
    url :url
    strategy :github_latest
  end

  # Wormhole updates itself (Settings → Updates), so `brew upgrade` leaves it alone unless --greedy.
  auto_updates true
  depends_on macos: :sonoma

  app "Wormhole.app"

  zap trash: [
    "~/Library/Application Support/Wormhole",
    "~/Library/Caches/app.getwormhole.terminal",
    "~/Library/HTTPStorages/app.getwormhole.terminal",
    "~/Library/Preferences/app.getwormhole.terminal.plist",
    "~/Library/Saved Application State/app.getwormhole.terminal.savedState",
  ]

  caveats <<~EOS
    The `wh` command line tool: Settings → Coding agents → Command line → Install.
  EOS
end
