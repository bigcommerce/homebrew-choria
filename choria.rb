class Choria < Formula
  desc "Orchestration System with roots in The Marionette Collective"
  homepage "https://choria.io/"
  url "https://github.com/choria-io/go-choria/archive/refs/tags/v0.27.0.tar.gz"
  sha256 "e8725acf899414980b92175a48844aefea3001044ba6273d4aaea93ac2a896c5"
  license "Apache-2.0"
  head "https://github.com/choria-io/go-choria.git", branch: "main"

  livecheck do
    url :stable
    strategy :github_latest
  end

  depends_on "go@1.20" => :build

  def install
    system Formula["go@1.20"].opt_prefix/"bin/go", "build", *std_go_args(ldflags: "-s -w"), "-o", bin/"choria", "main.go"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/choria version")
  end
end
