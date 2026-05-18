class Try < Formula
  desc "Ephemeral workspace manager for quick experiments"
  homepage "https://github.com/morellodev/try-rs"
  version "0.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/morellodev/try-rs/releases/download/v0.1.0/try-aarch64-apple-darwin.tar.gz"
      sha256 "eac0a016203bfe2a460edea8e38a4bd63e210933c704a980f2c4cf0173dfcd13"
    else
      url "https://github.com/morellodev/try-rs/releases/download/v0.1.0/try-x86_64-apple-darwin.tar.gz"
      sha256 "f6742039b187a0fe1f85c906406515d3e089601b5800892c0e0743458f7c8827"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/morellodev/try-rs/releases/download/v0.1.0/try-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "fc4729c4b4139013fbd586aacf1f70882b36fd232e12548721b223d370709d96"
    else
      url "https://github.com/morellodev/try-rs/releases/download/v0.1.0/try-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "4cb7aee8536c579a840c4628ce9baeb5dabd889048fd3c917d73da23acaf57d6"
    end
  end

  def install
    bin.install "try"
  end

  def caveats
    <<~EOS
      To set up the shell cd wrapper, add to your shell rc:
        eval "$(try init)"
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/try --version")
  end
end
