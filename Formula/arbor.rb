class Arbor < Formula
  desc "A CLI for managing git worktrees"
  homepage "https://github.com/morellodev/arbor"
  version "0.3.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/morellodev/arbor/releases/download/v0.3.0/arbor-aarch64-apple-darwin.tar.gz"
      sha256 "c4f54da35f680e6e22c9a3ba557e6700bf8563f578ed186b44ac22b6b3c5842f"
    else
      url "https://github.com/morellodev/arbor/releases/download/v0.3.0/arbor-x86_64-apple-darwin.tar.gz"
      sha256 "18a15db0e2caccd669e0508b64519011b5094d8f9cee2bf89fb9d19cf70366b8"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/morellodev/arbor/releases/download/v0.3.0/arbor-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "b0322eaa2c5521dea48074b2ef06c3891951195ee87cf0b94a87894f9146a397"
    else
      url "https://github.com/morellodev/arbor/releases/download/v0.3.0/arbor-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "76eaeca2a22c397771cde3ed34037dbfe0ba61007469bfa8747a747bd67b3a73"
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
