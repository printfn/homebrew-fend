class Fend < Formula
  desc "Arbitrary-precision unit-aware calculator"
  homepage "https://printfn.github.io/fend-website"
  url "https://github.com/printfn/fend/archive/refs/tags/v1.0.1.tar.gz"
  sha256 "1bc810b3ebfac8c97195b2aeba341f1e07d7ed58a5efc61e3597d76f358672f5"
  license "MIT"
  head "https://github.com/printfn/fend.git", branch: "main"

  livecheck do
    url :stable
    strategy :github_latest
  end

  bottle do
    root_url "https://github.com/printfn/homebrew-fend/releases/download/v1.0.1"
    rebuild 1
    sha256 cellar: :any_skip_relocation, monterey: "df607661093a1835e5addb759a7e5b34777132a73cfa1cf39cf89e7fb4cc535d"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args(path: "cli")
  end

  test do
    assert_equal "2", shell_output("#{bin}/fend 1+1").strip
  end
end
