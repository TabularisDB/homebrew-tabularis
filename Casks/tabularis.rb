cask "tabularis" do
  arch arm: "aarch64", intel: "882ce5caf54650a479ed19e921deda8e46059c66fab28fa9805efd78a511d586"

  version "0.9.11"
  sha256 arm:   "781dd6af47b141d2d3829d9447ff45d8c9e30cc153c3eb48712e76759b113b73",
         intel: "882ce5caf54650a479ed19e921deda8e46059c66fab28fa9805efd78a511d586"

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
