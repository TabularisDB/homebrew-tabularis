cask "tabularis" do
  arch arm: "aarch64", intel: "17eb4b47239bf5e86557f6573ba3c4766ad520bc8b3f31518bcd323c75ed9077"

  version "0.11.0"
  sha256 arm:   "04023b97e18b4ba9c86e5f2925726a391d9b358214a1ca50111d0acbc006605f",
         intel: "17eb4b47239bf5e86557f6573ba3c4766ad520bc8b3f31518bcd323c75ed9077"

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
