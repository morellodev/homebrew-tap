class Arbor < Formula
  desc "A CLI for managing git worktrees"
  homepage "https://github.com/morellodev/arbor"
  version "0.2.5"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/morellodev/arbor/releases/download/v0.2.5/arbor-aarch64-apple-darwin.tar.gz"
      sha256 "2c14d6e14b9aa645ae504c58f308346524f3b3eb4b0a7c7b7741add285ed8216"
    else
      url "https://github.com/morellodev/arbor/releases/download/v0.2.5/arbor-x86_64-apple-darwin.tar.gz"
      sha256 "9b5d6c67b38407c0c70e3173461ea17f0a836774194cf7cd24b16a0b141d4198"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/morellodev/arbor/releases/download/v0.2.5/arbor-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "a32f2c728266f9d13dc56ce7a33804d7f61d35f07a79a2d94505c2a101c2c059"
    else
      url "https://github.com/morellodev/arbor/releases/download/v0.2.5/arbor-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "e0d84ef4ad70bf98a280bf940ab6a4d4baef550500199b724e5b9e84a6a8d2a9"
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
