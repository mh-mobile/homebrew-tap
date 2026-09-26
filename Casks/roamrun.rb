cask "roamrun" do
  version "0.1.12"
  sha256 "fd6fadacad14f4062969b335346e4a7dc867faa908be3f9f554574af8add6ad9"

  url "https://github.com/mh-mobile/RoamRun/releases/download/v#{version}/RoamRun-#{version}.dmg"
  name "RoamRun"
  desc "Xcode wireless debugging for devices on another network, over Tailscale"
  homepage "https://github.com/mh-mobile/RoamRun"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: :ventura

  app "RoamRun.app"
  binary "#{appdir}/RoamRun.app/Contents/MacOS/RoamRun", target: "roamrun"

  uninstall quit: [
    "com.roamrun.app",
    "io.github.mh-mobile.roamrun",
  ]

  zap trash: [
    "~/Library/Application Support/RoamRun",
    "~/Library/Logs/RoamRun",
    "~/Library/Preferences/com.roamrun.app.plist",
    "~/Library/Preferences/io.github.mh-mobile.roamrun.plist",
  ]
end
