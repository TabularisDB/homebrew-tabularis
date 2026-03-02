cask "tabularis" do
  arch arm: "aarch64", intel: "d6897366b9c1aaa9faa97be7ba869680c2331af082e5cd7095bbcda032b9c119"

  version "0.9.3"
  sha256 arm:   "00b70e3bc04d5443feaec321beb16b12f1a5046c498e26d000af9fffa4491442",
         intel: "d6897366b9c1aaa9faa97be7ba869680c2331af082e5cd7095bbcda032b9c119"

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
