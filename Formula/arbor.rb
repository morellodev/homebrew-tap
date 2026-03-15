class Arbor < Formula
  desc "A CLI for managing git worktrees"
  homepage "https://github.com/morellodev/arbor"
  version "0.2.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/morellodev/arbor/releases/download/v0.2.1/arbor-aarch64-apple-darwin.tar.gz"
      sha256 "d4ffd72a23dc06caaf0a98d3827d2d643fa1ea8d98a6fd026fc490af81dfaf4e"
    else
      url "https://github.com/morellodev/arbor/releases/download/v0.2.1/arbor-x86_64-apple-darwin.tar.gz"
      sha256 "464860d732f26ce002b3e94b348e0189421798ac735643a40ce098e0058d41ab"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/morellodev/arbor/releases/download/v0.2.1/arbor-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "86dc03e89b8fab0e00f4b6ce8a7b4f95df043c30bc8de2b74ff941ad8cf5ca96"
    else
      url "https://github.com/morellodev/arbor/releases/download/v0.2.1/arbor-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "7d202b713ad124cd09ce14a4b0855de8134961b175157f9837780a8f1d56fdd1"
    end
  end

  def install
    bin.install "arbor"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/arbor --version")
  end
end
