class Arbor < Formula
  desc "A CLI for managing git worktrees"
  homepage "https://github.com/morellodev/arbor"
  version "0.1.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/morellodev/arbor/releases/download/v0.1.1/arbor-aarch64-apple-darwin.tar.gz"
      sha256 "cec9ffd5844b9b05a1445894f1443528c18e50c56f3e3a3f6c7d1e87ab01df5d"
    else
      url "https://github.com/morellodev/arbor/releases/download/v0.1.1/arbor-x86_64-apple-darwin.tar.gz"
      sha256 "76599c3dc7323f687abe50e537592ecd1e033934a9a33490eaff001b3d4254ff"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/morellodev/arbor/releases/download/v0.1.1/arbor-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "b60f629a008f8b10a74e7e372a9ae2808de858484d3b79b612fe064a74f1ce93"
    else
      url "https://github.com/morellodev/arbor/releases/download/v0.1.1/arbor-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "307416210fa690d19891e5daa9f1cd892b2b3fb56f9614a75ae768a94154e2e0"
    end
  end

  def install
    bin.install "arbor"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/arbor --version")
  end
end
