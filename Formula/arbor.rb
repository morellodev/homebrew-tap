class Arbor < Formula
  desc "A CLI for managing git worktrees"
  homepage "https://github.com/morellodev/arbor"
  version "0.2.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/morellodev/arbor/releases/download/v0.2.3/arbor-aarch64-apple-darwin.tar.gz"
      sha256 "017036e44a9b79b5e78c021e4db903c7a8b659fe0fa05a3092711369d9f6bf63"
    else
      url "https://github.com/morellodev/arbor/releases/download/v0.2.3/arbor-x86_64-apple-darwin.tar.gz"
      sha256 "687a0f72c6f247ecfc6167297a359db0c4f7caa5bd54105c148d44f984393e7a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/morellodev/arbor/releases/download/v0.2.3/arbor-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "878504826169e562452e2d4b55bb4b8a022eb9b9ecfbfe57ac27d34b7ffb7657"
    else
      url "https://github.com/morellodev/arbor/releases/download/v0.2.3/arbor-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "af65e7029d9e1367827481ac17e47cac22b1e9356f93ce1b2f6a85d52ba1d43e"
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
