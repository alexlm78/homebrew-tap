class Kree < Formula
  desc "Directory tree visualizer and fuzzy finder for the terminal"
  homepage "https://github.com/alexlm78/Kree"
  version "1.2.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/alexlm78/Kree/releases/download/v1.2.0/kree-macos-arm64.tar.gz"
      sha256 "f5f71b11792c0ea801307777ef9e8894346543a8a5f134bed25f7f952fbaecab"
    else
      url "https://github.com/alexlm78/Kree/releases/download/v1.2.0/kree-macos-x64.tar.gz"
      sha256 "2136ec242ac33c7ef99fdd98065512a8db869943a90e3927cc17b94b0857e24b"
    end
  end

  on_linux do
    url "https://github.com/alexlm78/Kree/releases/download/v1.2.0/kree-linux-x64.tar.gz"
    sha256 "bc2deaa6ef8490fdfc49903767378a181b9d958f03f152db413a5d5efe4ec684"
  end

  def install
    bin.install "kree"
    (man1/"kree.1").write Utils.safe_popen_read(bin/"kree", "--man")
    generate_completions_from_executable(bin/"kree", "--completions")
  end

  test do
    assert_match "directories", shell_output("#{bin}/kree -d 1")
  end
end
