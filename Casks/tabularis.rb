cask "tabularis" do
  arch arm: "aarch64", intel: "609e4d39456587acf81f938b4411bb16975e281e27a6e52019848f1d87abe795"

  version "0.8.10"
  sha256 arm:   "734f610112fe2d3f7b75470305a7e4acb5b2813b3ed4b9a53ad85655f1ca7053",
         intel: "609e4d39456587acf81f938b4411bb16975e281e27a6e52019848f1d87abe795"

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
