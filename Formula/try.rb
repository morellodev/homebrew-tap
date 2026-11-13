class Try < Formula
  desc "Ephemeral workspace manager for quick experiments"
  homepage "https://github.com/morellodev/try-rs"
  version "0.1.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/morellodev/try-rs/releases/download/v0.1.1/try-aarch64-apple-darwin.tar.gz"
      sha256 "c090d1a73c7f48a27f337864b132054c3125197ae90f7c94a9957a980e455c8a"
    else
      url "https://github.com/morellodev/try-rs/releases/download/v0.1.1/try-x86_64-apple-darwin.tar.gz"
      sha256 "22990e42dd4705b11184079ca8f691505f6c980980efe841c8e0538cc2c1ec72"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/morellodev/try-rs/releases/download/v0.1.1/try-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "a716182eadb864b3face7268f59bffddebacec9e2cb1abb8efeed75770832705"
    else
      url "https://github.com/morellodev/try-rs/releases/download/v0.1.1/try-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c478e91fc5fbb39e3de276fcbb387aea6086c1d8c9ab97fd1cba9f6281aefefb"
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
