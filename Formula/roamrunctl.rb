class Roamrunctl < Formula
  desc "Holds an iPhone's pairing and uses it over Tailscale; introduces a far Mac"
  homepage "https://github.com/mh-mobile/RoamRun"
  url "https://github.com/mh-mobile/RoamRun/archive/refs/tags/v0.13.0.tar.gz"
  sha256 "b0c40594ae113cd9d37fced50e5786cdd6399b592886a0f08eb80b5bf3016b17"
  license "MIT"
  head "https://github.com/mh-mobile/RoamRun.git", branch: "main"

  depends_on "rust" => :build

  def install
    cd "Rust/roamrunctl" do
      system "cargo", "install", *std_cargo_args
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/roamrunctl --version")
  end
end
