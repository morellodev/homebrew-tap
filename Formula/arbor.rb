class Arbor < Formula
  desc "A CLI for managing git worktrees"
  homepage "https://github.com/morellodev/arbor"
  version "0.3.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/morellodev/arbor/releases/download/v0.3.2/arbor-aarch64-apple-darwin.tar.gz"
      sha256 "b1eaa26c27c63e284b17d85f6b560fcba898407ca46910d201028221847a0eee"
    else
      url "https://github.com/morellodev/arbor/releases/download/v0.3.2/arbor-x86_64-apple-darwin.tar.gz"
      sha256 "eafd0944d70bab5ea3965266a8fa83815de053ccd459851f341dff503b8ba5ad"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/morellodev/arbor/releases/download/v0.3.2/arbor-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "f8a69b38dbc374af2d1da216bf3bbfd7de0a518f7fb3de7c69ba573e45702032"
    else
      url "https://github.com/morellodev/arbor/releases/download/v0.3.2/arbor-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "3bc1cddec4b42d53de1f98e357ca2c4909426a2a96dc0cc1148f739aaec70467"
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
