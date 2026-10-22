class Roamrunctl < Formula
  desc "Holds an iPhone's pairing and uses it over Tailscale; introduces a far Mac"
  homepage "https://github.com/mh-mobile/RoamRun"
  url "https://github.com/mh-mobile/RoamRun/archive/refs/tags/v0.8.1.tar.gz"
  sha256 "fa8353b7af03c3df41f405d976b508434d7c350e5e1ede89907b8b5334a33f6b"
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
