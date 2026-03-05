cask "tabularis" do
  arch arm: "aarch64", intel: "97b7925c5fb4c59bd09f92b5e1d3d47df8382028c1b21cd0f4a328342f7d85b3"

  version "0.9.5"
  sha256 arm:   "893bc4e47d57711be6399c31d32628b679de7b226cb10b610baa7c068b305aa2",
         intel: "97b7925c5fb4c59bd09f92b5e1d3d47df8382028c1b21cd0f4a328342f7d85b3"

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
