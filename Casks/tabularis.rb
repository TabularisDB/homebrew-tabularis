cask "tabularis" do
  arch arm: "aarch64", intel: "f031b501260e6ca0fd6e33500227ceb8ef0c8d09951f6e190500930cf3037792"

  version "0.9.6"
  sha256 arm:   "d5ca3962dc95fa80b4209fbbe538fcd769fbb08ca21ff218fb743e1698258bcb",
         intel: "f031b501260e6ca0fd6e33500227ceb8ef0c8d09951f6e190500930cf3037792"

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
