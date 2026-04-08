cask "tabularis" do
  arch arm: "aarch64", intel: "7f709a2fb119de0a8cf20b6c57f6504b2c99817b0c67fd889f83dcbdbd31d4c9"

  version "0.9.14"
  sha256 arm:   "1a7960ce990c1aa36f7a3761875ad49d30156af5d019e629a9f53e160e077c4e",
         intel: "7f709a2fb119de0a8cf20b6c57f6504b2c99817b0c67fd889f83dcbdbd31d4c9"

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
