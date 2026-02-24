cask "tabularis" do
  arch arm: "aarch64", intel: "f8e2fbfaa14fbf26c997eca55b1c5df738963323693c880f1b6b3862b0c2d620"

  version "0.9.0"
  sha256 arm:   "fcc8ee9d80cfbea8073ef16a8330d907496738a9e282c85a2c203d58f6d31293",
         intel: "f8e2fbfaa14fbf26c997eca55b1c5df738963323693c880f1b6b3862b0c2d620"

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
