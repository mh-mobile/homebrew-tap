cask "roamrun" do
  version "0.1.1"
  sha256 "71adce1951deb83ba7f91c5272e6cdfc1c5769fd8bab52a5553dccbc1fd01353"

  url "https://github.com/mh-mobile/RoamRun/releases/download/v#{version}/RoamRun-#{version}.dmg"
  name "RoamRun"
  desc "Xcode wireless debugging for devices on another network, over Tailscale"
  homepage "https://github.com/mh-mobile/RoamRun"

  livecheck do
    url :url
    strategy :github_latest
  end

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
    RoamRun is not notarized. macOS blocks it on first launch and after each
    upgrade: open it once, then allow it in
      System Settings → Privacy & Security → Open Anyway
  EOS
end
