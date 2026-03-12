cask "tabularis" do
  arch arm: "aarch64", intel: "dbf447eefbe66390d4c8299056c8c75b1be264c99e01cdb92561feef3acad207"

  version "0.9.8"
  sha256 arm:   "7a019545c75191c22949da3c3badc48795740a11fa71ecadf6520d3e79876111",
         intel: "dbf447eefbe66390d4c8299056c8c75b1be264c99e01cdb92561feef3acad207"

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
