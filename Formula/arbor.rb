class Arbor < Formula
  desc "A CLI for managing git worktrees"
  homepage "https://github.com/morellodev/arbor"
  version "0.3.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/morellodev/arbor/releases/download/v0.3.1/arbor-aarch64-apple-darwin.tar.gz"
      sha256 "f4b3db00a607b0e109395ce78a1fca1587bd4ec5e02d002f10fb063e2e84d12f"
    else
      url "https://github.com/morellodev/arbor/releases/download/v0.3.1/arbor-x86_64-apple-darwin.tar.gz"
      sha256 "5a32d583242c05ae3b935c847678bfcd3bee930572057d40a6887c7f38d1dcc9"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/morellodev/arbor/releases/download/v0.3.1/arbor-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "04e301b3536a05e7c4a68944ae4ef424962c7440f208734fb9c20fab8589c6af"
    else
      url "https://github.com/morellodev/arbor/releases/download/v0.3.1/arbor-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "abd81c6b2ee1da6d2f5c934ac2b8ad952ceaed994a8d68572e4217d4882c27fc"
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
