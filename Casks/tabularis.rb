cask "tabularis" do
  arch arm: "aarch64", intel: "c3cc5002645c3af174017d1895aaaefe4285a417e37a520584f799daecf20bfa"

  version "0.10.3"
  sha256 arm:   "ab200898fd9b424ca72f2e27b92eec16c9c9696460eb24b3324c54bd2a3b2c71",
         intel: "c3cc5002645c3af174017d1895aaaefe4285a417e37a520584f799daecf20bfa"

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
