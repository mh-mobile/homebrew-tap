cask "roamrun" do
  version "0.13.0"
  sha256 "d40495fd7f383dd872abe260ed4d8722c0cfdea3ef4e6a8e1deb7ca67c40e0a5"

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
