class Arbor < Formula
  desc "A CLI for managing git worktrees"
  homepage "https://github.com/morellodev/arbor"
  version "0.4.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/morellodev/arbor/releases/download/v0.4.1/arbor-aarch64-apple-darwin.tar.gz"
      sha256 "9592cbfee4c94591340e14eaf73cea19df546f71ce328a5339b0d39b3a3f0812"
    else
      url "https://github.com/morellodev/arbor/releases/download/v0.4.1/arbor-x86_64-apple-darwin.tar.gz"
      sha256 "ce8570e755a489441aaec30a8e8f0dc7a1d1e98de6033d7664eea24474981201"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/morellodev/arbor/releases/download/v0.4.1/arbor-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "9c8ebee82f456abc3c791ec775353b1c42d3089a405a636390ca397f8103a5ea"
    else
      url "https://github.com/morellodev/arbor/releases/download/v0.4.1/arbor-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c732992a7cbd3839f3e27a8916c44b58274965c73e3c8de75dc9b82ebbdc9313"
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
