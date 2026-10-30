class Roamrunctl < Formula
  desc "Holds an iPhone's pairing and uses it over Tailscale; introduces a far Mac"
  homepage "https://github.com/mh-mobile/RoamRun"
  url "https://github.com/mh-mobile/RoamRun/archive/refs/tags/v0.11.1.tar.gz"
  sha256 "6244a53dea1f64c8ebe2f79c0a86e2dbd678ee0acc2b03eb5413c3a60deb7482"
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
