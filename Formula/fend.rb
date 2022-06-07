class Fend < Formula
  desc "Arbitrary-precision unit-aware calculator"
  homepage "https://printfn.github.io/fend-website"
  url "https://github.com/printfn/fend/archive/refs/tags/v1.0.3.tar.gz"
  sha256 "dad3b6ef5fb1412f92dca303f894967fbaca67425aa00e57d53c49db8eabbc9c"
  license "MIT"
  head "https://github.com/printfn/fend.git", branch: "main"

  livecheck do
    url :stable
    strategy :github_latest
  end

  bottle do
    root_url "https://github.com/printfn/homebrew-fend/releases/download/v1.0.3"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args(path: "cli")
  end

  test do
    assert_equal "2", shell_output("#{bin}/fend 1+1").strip
  end
end
