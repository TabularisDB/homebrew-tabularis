cask "tabularis" do
  arch arm: "aarch64", intel: "c40304a91dbef79d5fa08583676b245a72b4dee2aff5e7712d59812063bb42a9"

  version "0.8.13"
  sha256 arm:   "49f3a9043f11953693219a6acf402dc8a7e38be6fdf224bd125f8a4308e170e8",
         intel: "c40304a91dbef79d5fa08583676b245a72b4dee2aff5e7712d59812063bb42a9"

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
