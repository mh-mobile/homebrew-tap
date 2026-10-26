cask "roamrun" do
  version "0.11.0"
  sha256 "10cc290a5c3a20c019d3354c2cd8be44603bfb94b4b56bb6fd117e9ae1f3aef6"

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
