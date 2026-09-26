cask "roamrun" do
  version "0.1.9"
  sha256 "43431fade13219184d3923608e15fe6a0a6b1190109115ccc5cca1bcc37e61c0"

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

  uninstall quit: "com.roamrun.app"

  zap trash: [
    "~/Library/Application Support/RoamRun",
    "~/Library/Logs/RoamRun",
    "~/Library/Preferences/com.roamrun.app.plist",
  ]

  caveats <<~EOS
    RoamRun is not notarized. macOS blocks it on first launch: open it once,
    then allow it in
      System Settings → Privacy & Security → Open Anyway
  EOS
end
