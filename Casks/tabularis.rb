cask "tabularis" do
  arch arm: "aarch64", intel: "3bf599a8a0395c2c1580877a8cd199b55849e780252a95f01a12a4816901387a"

  version "0.9.17"
  sha256 arm:   "4cc75ea467a498e21f01243292ea202e0d9dde95d209d97a8f6ec17be92a7428",
         intel: "3bf599a8a0395c2c1580877a8cd199b55849e780252a95f01a12a4816901387a"

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
