class Ttystorm < Formula
  desc "Stress tests, benchmarks and full-screen animations for any terminal"
  homepage "https://github.com/wormhole-terminal/ttystorm"
  url "https://github.com/wormhole-terminal/ttystorm/archive/refs/tags/v1.2.0.tar.gz"
  sha256 "572a98da083f2e9c7a1c15610c4c00629077675d79692eac005dbfd6316281e0"
  license "GPL-3.0-or-later"
  head "https://github.com/wormhole-terminal/ttystorm.git", branch: "main"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
    # Every animation and benchmark is a command of its own: a link that ttystorm recognises.
    Utils.safe_popen_read(bin/"ttystorm", "names").split.each do |name|
      bin.install_symlink "ttystorm" => name
    end
  end

  test do
    assert_match "roundtrip", shell_output("#{bin}/ttystorm names")
    assert_match "digital rain", shell_output("#{bin}/matrix --help")
  end
end
