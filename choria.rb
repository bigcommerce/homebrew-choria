class Choria < Formula
  desc "Orchestration System with roots in The Marionette Collective"
  homepage "https://choria.io/"
  url "https://github.com/choria-io/go-choria/archive/refs/tags/v0.29.1.tar.gz"
  sha256 "b2a5e8720e4ff6927d176f5d1c0eed394ce05c26ad174e680b5be2d4dcdc0fe8"
  license "Apache-2.0"
  head "https://github.com/choria-io/go-choria.git", branch: "main"

  livecheck do
    url :stable
    strategy :github_latest
  end

  depends_on "go@1.21" => :build

  def install
    system Formula["go@1.21"].opt_prefix/"bin/go", "build", *std_go_args(ldflags: "-s -w"), "-o", bin/"choria", "main.go"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/choria version")
  end
end
