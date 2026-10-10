class Roamrunctl < Formula
  desc "Introduces a far Mac to an iPhone, from a machine that has no RoamRun"
  homepage "https://github.com/mh-mobile/RoamRun"
  url "https://github.com/mh-mobile/RoamRun/archive/refs/tags/v0.5.0.tar.gz"
  sha256 "231de604267eb39f127512a9922e4aea6e7b92e35b65bca50337f2372c87285f"
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
