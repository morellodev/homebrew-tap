class Arbor < Formula
  desc "A CLI for managing git worktrees"
  homepage "https://github.com/morellodev/arbor"
  version "0.2.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/morellodev/arbor/releases/download/v0.2.2/arbor-aarch64-apple-darwin.tar.gz"
      sha256 "651b057ef4f359ebe69300fb0b4cbf3619ce60d7c4796642891d4d4b355a0e46"
    else
      url "https://github.com/morellodev/arbor/releases/download/v0.2.2/arbor-x86_64-apple-darwin.tar.gz"
      sha256 "442004121e1d561a2a5549f5002879843b7ab864bcf90b3d79cd847cd0db0b99"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/morellodev/arbor/releases/download/v0.2.2/arbor-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "a9cbcb4f8149930a941dd02dd63c8eb8e20c62b2ba5d45370ceb9ce055751ac8"
    else
      url "https://github.com/morellodev/arbor/releases/download/v0.2.2/arbor-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "18e557184a2b28a4f1f3082a015bf14d06e313209f274a5e2baa2302f95826ec"
    end
  end

  def install
    bin.install "arbor"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/arbor --version")
  end
end
