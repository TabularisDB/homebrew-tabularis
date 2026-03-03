cask "tabularis" do
  arch arm: "aarch64", intel: "3730a7fa26d9b249b492a55f5da48d095228c1a3298d48b4704dbb6c9aadab65"

  version "0.9.4"
  sha256 arm:   "8c5699bcad4277a606837e4109ef900368fdeda78032afe51e02f29b0cc6f7c7",
         intel: "3730a7fa26d9b249b492a55f5da48d095228c1a3298d48b4704dbb6c9aadab65"

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
