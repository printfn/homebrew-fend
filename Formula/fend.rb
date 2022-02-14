class Fend < Formula
  desc "Arbitrary-precision unit-aware calculator."
  homepage "https://printfn.github.io/fend-website"
  url "https://github.com/printfn/fend/archive/refs/tags/v0.1.28.tar.gz"
  sha256 "f15a6c8c0da2a888caeb912c0ffba23fe4646a14c0fc4ad5508c4e21f79764dc"
  license "MIT"
  head "https://github.com/printfn/fend.git", branch: "main"

  livecheck do
    url :stable
    strategy :github_latest
  end

  bottle do
    root_url "https://github.com/printfn/homebrew-fend/releases/download/#{version}"
    revision 1
    sha256 cellar: :any_skip_relocation, monterey: "96f5090b434157fd3cbe9d1e80a99c5b29772547e227df28ac198927912ef402"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args(path: "cli")
  end

  test do
    assert_equal "2", shell_output("#{bin}/fend 1+1").strip
  end
end
