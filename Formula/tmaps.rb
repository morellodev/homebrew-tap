class Tmaps < Formula
  desc "Terminal OpenStreetMap maps with a route planner and a JSON CLI"
  homepage "https://github.com/morellodev/tmaps"
  version "0.2.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/morellodev/tmaps/releases/download/v0.2.0/tmaps-aarch64-apple-darwin.tar.gz"
      sha256 "a44e386407485f1821c570cc8a0b3485a272803cf3814da5a343110ba44d56e1"
    end
    on_intel do
      url "https://github.com/morellodev/tmaps/releases/download/v0.2.0/tmaps-x86_64-apple-darwin.tar.gz"
      sha256 "6a37fd72a2dc6c7ac6ac8f5edcf2d45c8d2218ddad072fcd23191b1ae6bbebc0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/morellodev/tmaps/releases/download/v0.2.0/tmaps-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "50954997b6aa4110ec14ee05b3f063512712f13b87eb8e69f69802e82a9e1efe"
    end
    on_intel do
      url "https://github.com/morellodev/tmaps/releases/download/v0.2.0/tmaps-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "965446d5c9bb74f357937e1efb10e0c57c24bf14998eb8c48ce4d1941965c814"
    end
  end

  def install
    bin.install "tmaps"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/tmaps --version")
  end
end
