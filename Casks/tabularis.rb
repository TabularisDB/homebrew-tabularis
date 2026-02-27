cask "tabularis" do
  arch arm: "aarch64", intel: "fb4ee697e3152b236f7e09678493dc556b77758692263976ea3a7a63e9337dad"

  version "0.9.2"
  sha256 arm:   "d581ac938985192545b00c4aadd11a9a4c89f955ebd65c982d94e38a5081d924",
         intel: "fb4ee697e3152b236f7e09678493dc556b77758692263976ea3a7a63e9337dad"

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
