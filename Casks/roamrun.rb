cask "roamrun" do
  version "0.1.0"
  sha256 "5a0ca2bfe04cfc8398d69655bf1c5f2fe62900dd5d673fe0c898d117a5c89148"

  url "https://github.com/mh-mobile/RoamRun/releases/download/v#{version}/RoamRun-#{version}.dmg"
  name "RoamRun"
  desc "Xcode wireless debugging for devices on another network, over Tailscale"
  homepage "https://github.com/mh-mobile/RoamRun"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :ventura"

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

    The roamrun command is already linked by Homebrew; skip the app's
    "Install…" for the command line tool.
  EOS
end
