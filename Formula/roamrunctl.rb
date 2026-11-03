class Roamrunctl < Formula
  desc "Holds an iPhone's pairing and uses it over Tailscale; introduces a far Mac"
  homepage "https://github.com/mh-mobile/RoamRun"
  url "https://github.com/mh-mobile/RoamRun/archive/refs/tags/v0.12.0.tar.gz"
  sha256 "fadf278ca71ee22b92685e43998f1c33e635ed46c1419644ad3b27922a62c280"
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
