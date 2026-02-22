cask "tabularis" do
  arch arm: "aarch64", intel: "f6f17240f85f25fd9c7aabafe577953f5cc800033ce0d9c4108992efc6a7fba3"

  version "0.8.15"
  sha256 arm:   "581e9ea3c10ce59fa84cdcd3a07e069a64e8a817afdc0f559033e673427ca506",
         intel: "f6f17240f85f25fd9c7aabafe577953f5cc800033ce0d9c4108992efc6a7fba3"

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
