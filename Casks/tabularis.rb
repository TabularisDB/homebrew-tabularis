cask "tabularis" do
  arch arm: "aarch64", intel: "bc24e0fefdb0fe539d9b685f2598835c2d1ab685b5e5d65e4eee17eeec415196"

  version "0.8.14"
  sha256 arm:   "5c6cdb6150ddfffb778340f013c3d7a53a5a4275560a088c38a9e22b0c0658e1",
         intel: "bc24e0fefdb0fe539d9b685f2598835c2d1ab685b5e5d65e4eee17eeec415196"

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
