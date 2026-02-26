cask "tabularis" do
  arch arm: "aarch64", intel: "d9d64381e5ca4453c4ebf9e17b85adfc88174ee5c82975df79da0e8ee4504d2e"

  version "0.9.1"
  sha256 arm:   "fa6320001d3f556aad4136f3c3acdca1f74efaa833443b9ddaaa5039a912b102",
         intel: "d9d64381e5ca4453c4ebf9e17b85adfc88174ee5c82975df79da0e8ee4504d2e"

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
