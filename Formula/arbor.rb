class Arbor < Formula
  desc "A CLI for managing git worktrees"
  homepage "https://github.com/morellodev/arbor"
  version "0.3.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/morellodev/arbor/releases/download/v0.3.4/arbor-aarch64-apple-darwin.tar.gz"
      sha256 "f0bc58938b0a0a0192440919a4b7ce81859c220b441c467ef7012753782a5553"
    else
      url "https://github.com/morellodev/arbor/releases/download/v0.3.4/arbor-x86_64-apple-darwin.tar.gz"
      sha256 "9c2e8356de4e0824e70e25cbe6bd1e8e3b56f2bb522316f9cf3ffb91add06f9f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/morellodev/arbor/releases/download/v0.3.4/arbor-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "1fef8ca777eafa7475739dbe714a0e07e2896ea9257c20f1824cede5177a2071"
    else
      url "https://github.com/morellodev/arbor/releases/download/v0.3.4/arbor-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "28c983d45dbda1037d763264f4d9de7b7391348ab8acf7090242c42e10de97e6"
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
