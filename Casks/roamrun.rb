cask "roamrun" do
  version "0.1.16"
  sha256 "f6785b9e1c02b8f4e1845712d22e209c41665a446437dbd551e2d295f15d2330"

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
