cask "tabularis" do
  arch arm: "aarch64", intel: "a46f8c346ffdaa0aa256f89de8765cdbad534cd510135753d8dd1bf5505f14be"

  version "0.8.6"
  sha256 arm:   "e23e997f3004b122ceb8408d3e00c836079f9634fd7a0d6c760e4c446109c6a2",
         intel: "a46f8c346ffdaa0aa256f89de8765cdbad534cd510135753d8dd1bf5505f14be"

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
