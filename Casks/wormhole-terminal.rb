cask "wormhole-terminal" do
  version "1.6.2"
  sha256 "f92777af33d07253a01cc0ebbf919f185088c00c1baf0e7db42903e8072be91f"

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
