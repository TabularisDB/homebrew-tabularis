cask "tabularis" do
  arch arm: "aarch64", intel: "7286b8e19d7587ae48700f8073cbbdcf88e75f439b34b04d2ae653fae9d745b3"

  version "0.9.9"
  sha256 arm:   "6adb9725266e1ea57f9fb43f2e1fa68e0f8031e6ad8c521f4b543d5409236e7d",
         intel: "7286b8e19d7587ae48700f8073cbbdcf88e75f439b34b04d2ae653fae9d745b3"

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
