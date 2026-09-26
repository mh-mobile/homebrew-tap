cask "roamrun" do
  version "0.1.8"
  sha256 "bc7eba7e89ad899d8a95c5e0431f2257d72c0a290bc8af93b00dd2306417cfc1"

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
