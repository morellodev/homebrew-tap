class Arbor < Formula
  desc "A CLI for managing git worktrees"
  homepage "https://github.com/morellodev/arbor"
  version "0.4.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/morellodev/arbor/releases/download/v0.4.0/arbor-aarch64-apple-darwin.tar.gz"
      sha256 "67d8fe22acca5a6fc6200f2fca2e8d1a45928e273e0c058fa911bd961b4883bd"
    else
      url "https://github.com/morellodev/arbor/releases/download/v0.4.0/arbor-x86_64-apple-darwin.tar.gz"
      sha256 "71cd06d346daa7f9965064a5f2be383c9024e77857067a1009d549ae3dd7f160"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/morellodev/arbor/releases/download/v0.4.0/arbor-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "5075109281a61ff67ea14fd87f558e174585d1fc2762f8ac2ce4d1986972af8f"
    else
      url "https://github.com/morellodev/arbor/releases/download/v0.4.0/arbor-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "8c53786a1570a8f12794d23102f42896be4aa53b93e9fbc58989de0617b271d3"
    end
  end

  def install
    bin.install "arbor"
  end

  def caveats
    <<~EOS
      To set up shell integration (completions + cd wrapper), run:
        arbor init
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/arbor --version")
  end
end
