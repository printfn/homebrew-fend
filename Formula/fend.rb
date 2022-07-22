class Fend < Formula
  desc "Arbitrary-precision unit-aware calculator"
  homepage "https://printfn.github.io/fend-website"
  url "https://github.com/printfn/fend/archive/refs/tags/v1.0.4.tar.gz"
  sha256 "b136937e5251160c17f46cb1b4ba80482e321bf70b82527856504c875ff0376f"
  license "MIT"
  head "https://github.com/printfn/fend.git", branch: "main"

  livecheck do
    url :stable
    strategy :github_latest
  end

  bottle do
    root_url "https://github.com/printfn/homebrew-fend/releases/download/v1.0.4"
    rebuild 1
    sha256 cellar: :any_skip_relocation, arm64_monterey: "fa86893842a7040b74a541a75335d7f97beb344ab13ac7c3529f7d6f56ebd5c1"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args(path: "cli")
  end

  test do
    assert_equal "2", shell_output("#{bin}/fend 1+1").strip
  end
end
