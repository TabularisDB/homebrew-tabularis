cask "tabularis" do
  arch arm: "aarch64", intel: "d69af6d009b5138a6e904f88af520fd70c445a8b34ba04a197cef0f21cf26b16"

  version "0.9.21"
  sha256 arm:   "4ed793b7488678ba0839f7d47a519052a216a3ec0471ebcb73937cf85e6af3d7",
         intel: "d69af6d009b5138a6e904f88af520fd70c445a8b34ba04a197cef0f21cf26b16"

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
