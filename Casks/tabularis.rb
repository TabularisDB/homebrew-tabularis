cask "tabularis" do
  arch arm: "aarch64", intel: "5890bff9bbe19ab019d57eb00efc094939800ae428dffe7fa45fc9d2e9fc87d8"

  version "0.9.16"
  sha256 arm:   "a04256629b32377fb3cbbc6944a4b1ad312e87043fa9bb242ad8871687659eb0",
         intel: "5890bff9bbe19ab019d57eb00efc094939800ae428dffe7fa45fc9d2e9fc87d8"

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
