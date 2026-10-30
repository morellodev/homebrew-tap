class Tmaps < Formula
  desc "Terminal OpenStreetMap maps with a route planner and a JSON CLI"
  homepage "https://github.com/morellodev/tmaps"
  version "0.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/morellodev/tmaps/releases/download/v0.1.0/tmaps-aarch64-apple-darwin.tar.gz"
      sha256 "45a475aff3fbfb1e399746143952b909e85e174b9a233b8d7b002096124ea4c2"
    end
    on_intel do
      url "https://github.com/morellodev/tmaps/releases/download/v0.1.0/tmaps-x86_64-apple-darwin.tar.gz"
      sha256 "bf4d2911e25285dcf7500cc194cd50dad0491e5e9f7eb1238cbcf19b27899a85"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/morellodev/tmaps/releases/download/v0.1.0/tmaps-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "dc1b1d2d963dbcf9b9232c0d0dd390d5562eee0becb83e448c83a1a6bd2fe493"
    end
    on_intel do
      url "https://github.com/morellodev/tmaps/releases/download/v0.1.0/tmaps-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "2a1e9d7e7df3a05da533c79ffbd557150a21395f31bc588f1cf9c3bd95d925f7"
    end
  end

  def install
    bin.install "tmaps"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/tmaps --version")
  end
end
