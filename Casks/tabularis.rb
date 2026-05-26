cask "tabularis" do
  arch arm: "aarch64", intel: "9f8025ba0843b67653c71b4971b3c90d3a581533177e9594de852cca917b5eb9"

  version "0.12.0"
  sha256 arm:   "e210427e63d76cbcf0451072cbc79267149d23aa56295c2a725aaaef31561900",
         intel: "9f8025ba0843b67653c71b4971b3c90d3a581533177e9594de852cca917b5eb9"

  url "https://github.com/TabularisDB/tabularis/releases/download/v#{version}/tabularis_#{version}_#{arch}.dmg"
  name "Tabularis"
  desc "Lightweight, developer-focused database management tool"
  homepage "https://github.com/TabularisDB/tabularis"

  livecheck do
    url :url
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  auto_updates true
  depends_on macos: ">= :monterey"

  app "tabularis.app"
  
  postflight do
  system_command "xattr",
                  args: [
                      "-c", "#{appdir}/tabularis.app"
                  ]
  end

  zap trash: [
    "~/Library/Application Support/tabularis",
    "~/Library/Caches/tabularis",
    "~/Library/Logs/tabularis",
    "~/Library/Preferences/com.debba.tabularis.plist",
    "~/Library/Saved Application State/com.debba.tabularis.savedState",
  ]
end
