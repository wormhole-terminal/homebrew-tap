cask "wormhole-terminal" do
  version "1.1.0"
  sha256 "7de32ee669625300a3fd2655739c20978dd979f0748bb133734f8d5fd12f383d"

  url "https://github.com/wormhole-terminal/wormhole/releases/download/v#{version}/Wormhole-#{version}-macos.dmg"
  name "Wormhole"
  desc "Terminal for working with AI coding agents"
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
