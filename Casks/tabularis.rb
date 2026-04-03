cask "tabularis" do
  arch arm: "aarch64", intel: "bfd9de80a63663b9732f3d119884c2dae1a9f8806fe600b5d9eeae74ccdbd5ab"

  version "0.9.13"
  sha256 arm:   "8a03e4a5ead52c6a5915524e84a74b441580f7f1cec607db555c72161625d62b",
         intel: "bfd9de80a63663b9732f3d119884c2dae1a9f8806fe600b5d9eeae74ccdbd5ab"

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
