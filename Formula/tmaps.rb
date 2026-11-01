class Tmaps < Formula
  desc "Terminal OpenStreetMap maps with a route planner and a JSON CLI"
  homepage "https://github.com/morellodev/tmaps"
  version "0.3.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/morellodev/tmaps/releases/download/v0.3.0/tmaps-aarch64-apple-darwin.tar.gz"
      sha256 "f07dcefbf3e1e48eb165ff8e810788e7a4247122165e7dea39a02f99e548743d"
    end
    on_intel do
      url "https://github.com/morellodev/tmaps/releases/download/v0.3.0/tmaps-x86_64-apple-darwin.tar.gz"
      sha256 "b395d67e00272660d82b4bd2294f81ab2ef5b0279078b969bc50ae44d6b9b1b2"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/morellodev/tmaps/releases/download/v0.3.0/tmaps-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "6c36c3d99b9891b887f55a8dbfda8751983f6b930f7ddbf320c02547962e0fb1"
    end
    on_intel do
      url "https://github.com/morellodev/tmaps/releases/download/v0.3.0/tmaps-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "b6999349d99ad5f854b08553f9d4e4b8f67716a95eb627d6846dabdbb77736fb"
    end
  end

  def install
    bin.install "tmaps"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/tmaps --version")
  end
end
