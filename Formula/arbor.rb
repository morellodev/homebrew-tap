class Arbor < Formula
  desc "A CLI for managing git worktrees"
  homepage "https://github.com/morellodev/arbor"
  version "0.1.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/morellodev/arbor/releases/download/v0.1.2/arbor-aarch64-apple-darwin.tar.gz"
      sha256 "b12473fe8687adcfd15796ef1bcc9cd28d65a1828e0ebb421b6f3378a676b9c4"
    else
      url "https://github.com/morellodev/arbor/releases/download/v0.1.2/arbor-x86_64-apple-darwin.tar.gz"
      sha256 "816f621bdd004b0b3fbb96ffe614e0cd1bdac0a1d21e94ea19a0e5f791b5c85c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/morellodev/arbor/releases/download/v0.1.2/arbor-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "99052b4e8bd2e0abc0fd74adaacae32a4044931d886a0786f3d1d50f99e248ff"
    else
      url "https://github.com/morellodev/arbor/releases/download/v0.1.2/arbor-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "373392d43f1c8683921c90731fd1c28e9a440de58f7a6f701fd67e67d62e6fd4"
    end
  end

  def install
    bin.install "arbor"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/arbor --version")
  end
end
