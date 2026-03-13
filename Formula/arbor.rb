class Arbor < Formula
  desc "A CLI for managing git worktrees"
  homepage "https://github.com/morellodev/arbor"
  version "0.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/morellodev/arbor/releases/download/v0.1.0/arbor-aarch64-apple-darwin.tar.gz"
      sha256 "f449f1cf67838483b2614c318835cb4c0da5022e494a9a01d85759be4202a250"
    else
      url "https://github.com/morellodev/arbor/releases/download/v0.1.0/arbor-x86_64-apple-darwin.tar.gz"
      sha256 "a60e7f7d52ded20920142658e801ea9d994dd6697d46138780e9173ece14102a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/morellodev/arbor/releases/download/v0.1.0/arbor-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "17ed9ea9a069b8a717b53cec1f6267f8dcdf683fb36c2b6f59f47dac38d13737"
    else
      url "https://github.com/morellodev/arbor/releases/download/v0.1.0/arbor-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "889be9d7c648a466fb7e56a1e335eb26f292b93b73eeb8c7f1834b1deef12b08"
    end
  end

  def install
    bin.install "arbor"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/arbor --version")
  end
end
