class Choria < Formula
  desc "Orchestration System with roots in The Marionette Collective"
  homepage "https://choria.io/"
  url "https://github.com/choria-io/go-choria/archive/refs/tags/v0.24.1.tar.gz"
  sha256 "7d869b0b84b01582f4b1e1730fac32eb66b6bfe56726ef458370a0e72134ca88"
  license "Apache-2.0"
  head "https://github.com/choria-io/go-choria.git", branch: "main"

  livecheck do
    url :stable
    strategy :github_latest
  end

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w"), "-o", bin/"choria", "main.go"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/choria version")
  end
end
