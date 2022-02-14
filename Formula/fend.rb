class Fend < Formula
  desc "Arbitrary-precision unit-aware calculator."
  homepage "https://printfn.github.io/fend-website"
  url "https://github.com/printfn/fend/archive/refs/tags/v0.1.28.tar.gz"
  sha256 "101bb530f7e2802733c4b41397c795933f27c098a3b37ea8ccf007539af59dc0"
  license "MIT"
  head "https://github.com/printfn/fend.git", branch: "main"

  livecheck do
    url :stable
    strategy :github_latest
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args(path: "cli")
  end

  test do
    assert_equal "2", shell_output("#{bin}/fend 1+1").strip
  end
end
