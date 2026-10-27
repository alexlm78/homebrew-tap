# typed: strict
# frozen_string_literal: true

# Template of the Homebrew formula for eka-ls. The release workflow fills the
# @...@ fields with scripts/update-formula.sh and pushes the result to
# Formula/eka-ls.rb in alexlm78/homebrew-tap. The program installs as `eka`.
class EkaLs < Formula
  desc "Modern replacement for ls with GNU-compatible output"
  homepage "https://github.com/alexlm78/eka"
  version "0.5.9"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/alexlm78/eka/releases/download/v0.5.9/eka-0.5.9-aarch64-apple-darwin.tar.gz"
      sha256 "e8a1d618bb5ea91f068d8611870d5f38fc3496f3b48fe90aa94a629d51b89a21"
    end
    on_intel do
      url "https://github.com/alexlm78/eka/releases/download/v0.5.9/eka-0.5.9-x86_64-apple-darwin.tar.gz"
      sha256 "04f43c51ab3651b7a632add2e302908d41ba6954ff0790eea535246cda92fb6c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/alexlm78/eka/releases/download/v0.5.9/eka-0.5.9-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "d0f6652549c52aa075a0d45f49fd9a8501841a4ff4bd6365c69bfe1356392db8"
    end
    on_intel do
      url "https://github.com/alexlm78/eka/releases/download/v0.5.9/eka-0.5.9-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d099dd625075911a2ceafd887d0dbcbd6b7ac5789aa76cca2fddafaa3d3fdf5b"
    end
  end

  def install
    bin.install "eka"
    man1.install "eka.1"
    bash_completion.install "completions/eka.bash" => "eka"
    zsh_completion.install "completions/_eka"
    fish_completion.install "completions/eka.fish"
  end

  test do
    (testpath/"a.txt").write("x")
    assert_match version.to_s, shell_output("#{bin}/eka --version")
    assert_equal "a.txt\n", shell_output("#{bin}/eka -1 #{testpath}")
  end
end
