cask "tabularis" do
  arch arm: "aarch64", intel: "2b5a960e3a2c5c8e67f496f41ddaacb6400599c5765b57d4a5dbc9279ba9b4cf"

  version "0.8.7"
  sha256 arm:   "46d70212ebe062b09eaa7ccb0e59f7ca08b5fe6fdb936b669f1333eaf891754f",
         intel: "2b5a960e3a2c5c8e67f496f41ddaacb6400599c5765b57d4a5dbc9279ba9b4cf"

  url "https://github.com/debba/tabularis/releases/download/v#{version}/tabularis_#{version}_#{arch}.dmg"
  name "Tabularis"
  desc "Lightweight, developer-focused database management tool"
  homepage "https://github.com/debba/tabularis"

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
