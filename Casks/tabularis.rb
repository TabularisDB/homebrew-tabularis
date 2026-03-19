cask "tabularis" do
  arch arm: "aarch64", intel: "8898bb50f6b77fd78c8734151c979ef6ce21683544bca2b3e43ed890605d3d1b"

  version "0.9.10"
  sha256 arm:   "821258cc0fe542cf95a39bcd21a0db365f50533b99eb0cb314bffa6c3d1339a9",
         intel: "8898bb50f6b77fd78c8734151c979ef6ce21683544bca2b3e43ed890605d3d1b"

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
