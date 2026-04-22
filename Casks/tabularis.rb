cask "tabularis" do
  arch arm: "aarch64", intel: "9beab2a467a6045eff99196e831551213c2ee5102d3d86afaea137daead767b2"

  version "0.9.20"
  sha256 arm:   "a283adc6b4722101ef6e810afb892c2f1d16e8e476e06381d1730155f4006271",
         intel: "9beab2a467a6045eff99196e831551213c2ee5102d3d86afaea137daead767b2"

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
