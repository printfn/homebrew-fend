class Fend < Formula
  desc "Arbitrary-precision unit-aware calculator."
  homepage "https://printfn.github.io/fend-website"
  url "https://github.com/printfn/fend/archive/refs/tags/v0.1.29.tar.gz"
  sha256 "926e6d5c4c13573f2c93126ca9b6a82ad6cd270e9738ce07c5d9e246b4f84dbd"
  license "MIT"
  head "https://github.com/printfn/fend.git", branch: "main"

  livecheck do
    url :stable
    strategy :github_latest
  end

  bottle do
    rebuild 1
    root_url "https://github.com/printfn/homebrew-fend/releases/download/v0.1.29"
    sha256 cellar: :any_skip_relocation, monterey: "9c30d031d1d3b037fec251f23f4b767fdabdfeabe11732909255231ecce69fed"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args(path: "cli")
  end

  test do
    assert_equal "2", shell_output("#{bin}/fend 1+1").strip
  end
end
