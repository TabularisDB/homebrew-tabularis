cask "tabularis" do
  arch arm: "aarch64", intel: "790051f93b35f50dd75eb5397c1d99c4c9d3f2be7c98c029bc6984a081c6f99d"

  version "0.9.7"
  sha256 arm:   "87caadc8159459166b938de512943628ed4f3c462cc5f112973dc3050dfb94b1",
         intel: "790051f93b35f50dd75eb5397c1d99c4c9d3f2be7c98c029bc6984a081c6f99d"

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
