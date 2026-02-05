cask "tabularis" do
  arch arm: "aarch64", intel: "00a32f5f6dd8f2319450dbb774381dbf227fc4a48e3af27e518a8213ffadd962"

  version "0.8.8"
  sha256 arm:   "9f44e82d81f3b01129a32dd139af49b798bda84e01c633e811df0fa035189583",
         intel: "00a32f5f6dd8f2319450dbb774381dbf227fc4a48e3af27e518a8213ffadd962"

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
