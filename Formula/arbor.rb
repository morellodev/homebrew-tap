class Arbor < Formula
  desc "A CLI for managing git worktrees"
  homepage "https://github.com/morellodev/arbor"
  version "0.2.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/morellodev/arbor/releases/download/v0.2.0/arbor-aarch64-apple-darwin.tar.gz"
      sha256 "85e9b5c32241500ad07cb7b460a28dbf7fcac3b6e2f0edb18c7b59ab772aeb4b"
    else
      url "https://github.com/morellodev/arbor/releases/download/v0.2.0/arbor-x86_64-apple-darwin.tar.gz"
      sha256 "9d3c6a5e7211fc32ea3e5afd6a89271b7fffa99891ea1a822565063b0c791aab"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/morellodev/arbor/releases/download/v0.2.0/arbor-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "60de542dbdb9dd32b5ba33dd8a1fc1cf9ffccb7e1b2b208e63126b140ae4126c"
    else
      url "https://github.com/morellodev/arbor/releases/download/v0.2.0/arbor-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "bd717c6bf28d4d20d50e83ba2a85b43c16466fe3818038dd48798ce41bddb9ad"
    end
  end

  def install
    bin.install "arbor"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/arbor --version")
  end
end
