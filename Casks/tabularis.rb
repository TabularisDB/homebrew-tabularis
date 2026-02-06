cask "tabularis" do
  arch arm: "aarch64", intel: "3b15a4d94476ea5cfd6978e1e6787aadfb1405bce6fd455a582ee7847dd431fe"

  version "0.8.9"
  sha256 arm:   "6cb74051673cb444fe16970c405231cab78b6e41febf5ac171440bebcde2e6ed",
         intel: "3b15a4d94476ea5cfd6978e1e6787aadfb1405bce6fd455a582ee7847dd431fe"

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
