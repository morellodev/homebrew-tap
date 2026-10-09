class Arbor < Formula
  desc "A CLI for managing git worktrees"
  homepage "https://github.com/morellodev/arbor"
  version "0.3.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/morellodev/arbor/releases/download/v0.3.3/arbor-aarch64-apple-darwin.tar.gz"
      sha256 "c140c464cff500f215eff602da3675891f32d448fa86a80d751e8ea4cb574c43"
    else
      url "https://github.com/morellodev/arbor/releases/download/v0.3.3/arbor-x86_64-apple-darwin.tar.gz"
      sha256 "c832a670c785754f2e4d7484d6ad99ad07293b77f06a2fa1335bab1818c08886"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/morellodev/arbor/releases/download/v0.3.3/arbor-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "ecb95cf78cdd0eeedda2fab4a1101d97e452b4006b04f640cc6108a59f262c5d"
    else
      url "https://github.com/morellodev/arbor/releases/download/v0.3.3/arbor-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "63e6ee7216df084b55fb05470f8b62545b19b53db0c609fde9933ffdf120577a"
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
