cask "tabularis" do
  arch arm: "aarch64", intel: "b015ee806d8869ab0498a55ffa98cae4fe661d63e10ac6a73b22c2c27691f3e5"

  version "0.9.12"
  sha256 arm:   "5809d9e94708fd90a9a777ae05b6999b3ec0251e3a0835787ce2f8e159326768",
         intel: "b015ee806d8869ab0498a55ffa98cae4fe661d63e10ac6a73b22c2c27691f3e5"

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
