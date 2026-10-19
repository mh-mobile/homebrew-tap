class Roamrunctl < Formula
  desc "Holds an iPhone's pairing and uses it over Tailscale; introduces a far Mac"
  homepage "https://github.com/mh-mobile/RoamRun"
  url "https://github.com/mh-mobile/RoamRun/archive/refs/tags/v0.8.0.tar.gz"
  sha256 "91edb1d11bc74ff1c1549d6933d1a544f99be4e511650a4e5fe805865984ebbd"
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
