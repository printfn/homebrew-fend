class Fend < Formula
  desc "Arbitrary-precision unit-aware calculator"
  homepage "https://printfn.github.io/fend-website"
  url "https://github.com/printfn/fend/archive/refs/tags/v1.0.2.tar.gz"
  sha256 "044da33fff7068a6a89a85bfd5c21f642dde73b523d231462835721c2fcd90df"
  license "MIT"
  head "https://github.com/printfn/fend.git", branch: "main"

  livecheck do
    url :stable
    strategy :github_latest
  end

  bottle do
    root_url "https://github.com/printfn/homebrew-fend/releases/download/v1.0.2"
    rebuild 1
    sha256 cellar: :any_skip_relocation, monterey: "9982bba54c5f5ea4a2896690fc162fc6af3fe2023b5e4570098384da680eeea6"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args(path: "cli")
  end

  test do
    assert_equal "2", shell_output("#{bin}/fend 1+1").strip
  end
end
