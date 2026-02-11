cask "tabularis" do
  arch arm: "aarch64", intel: "9b775e388871ca8524e7e2b19558f4b6c0e9373e8b5833b93a80364c84cc4682"

  version "0.8.11"
  sha256 arm:   "f2d812613935e0e8dab215e7dd3082cfa5c01690e3e754821ebfa66c0861eecb",
         intel: "9b775e388871ca8524e7e2b19558f4b6c0e9373e8b5833b93a80364c84cc4682"

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
