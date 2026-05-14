cask "tabularis" do
  arch arm: "aarch64", intel: "9265139cdfe411b02fbb5fa0bc37290b12fb55c17fdc7dd1a35e7034d0de55bf"

  version "0.10.2"
  sha256 arm:   "15154bbe2ee36a9cba3dc726ae6d22502a2960121ed1929871327e5ea49987de",
         intel: "9265139cdfe411b02fbb5fa0bc37290b12fb55c17fdc7dd1a35e7034d0de55bf"

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
