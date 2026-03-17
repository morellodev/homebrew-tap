class Arbor < Formula
  desc "A CLI for managing git worktrees"
  homepage "https://github.com/morellodev/arbor"
  version "0.2.6"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/morellodev/arbor/releases/download/v0.2.6/arbor-aarch64-apple-darwin.tar.gz"
      sha256 "984d89b6cf65244412b9807ce181b5f1adc6dfa833cd74a69ce41cbe0a75f3a3"
    else
      url "https://github.com/morellodev/arbor/releases/download/v0.2.6/arbor-x86_64-apple-darwin.tar.gz"
      sha256 "2ecb97d13f34835f08cca97ec63081f5037fb1cab10c6360fca108a8c35b19a3"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/morellodev/arbor/releases/download/v0.2.6/arbor-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "15de38efcdf20c2acffb89d9bc5984cd113459bfc7d171a88583379f6cb6c624"
    else
      url "https://github.com/morellodev/arbor/releases/download/v0.2.6/arbor-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "3806951e56ffed141f8a1fad930e3aa7cef9373e44b13491ef30ade67661f817"
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
