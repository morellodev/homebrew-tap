class Arbor < Formula
  desc "A CLI for managing git worktrees"
  homepage "https://github.com/morellodev/arbor"
  version "0.2.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/morellodev/arbor/releases/download/v0.2.4/arbor-aarch64-apple-darwin.tar.gz"
      sha256 "1eac53a5fd593d960bedce577a2db5510d00728f265b4a461db9264f74e19168"
    else
      url "https://github.com/morellodev/arbor/releases/download/v0.2.4/arbor-x86_64-apple-darwin.tar.gz"
      sha256 "e4f174d5992205e05c9d171fb7378e43779579ea0bb088a77d3d11fd5dd20eef"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/morellodev/arbor/releases/download/v0.2.4/arbor-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "deeb240e8f3ead86ddd4bc091e3ddaec6815d9594607316fb6bc27020ac134f3"
    else
      url "https://github.com/morellodev/arbor/releases/download/v0.2.4/arbor-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c149039238a9494b8e9d4458dec86ba0f13cab6e549370ed6a68c697e3a63f86"
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
