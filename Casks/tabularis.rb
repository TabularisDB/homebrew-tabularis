cask "tabularis" do
  arch arm: "aarch64", intel: "cd40c604d0ddaedc31fb5195d60c77a528772399352eff487e7a211ac28cbbd5"

  version "0.10.0"
  sha256 arm:   "bbffd18ff4577059fbb19a31f970edf3aa316ee9b828578c27b949dc3d5302af",
         intel: "cd40c604d0ddaedc31fb5195d60c77a528772399352eff487e7a211ac28cbbd5"

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
