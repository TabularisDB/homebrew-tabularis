cask "tabularis" do
  arch arm: "aarch64", intel: "a8688eb55d769bee3f546593261ba7a195890e675f51944debc3d8e8f9595389"

  version "0.10.1"
  sha256 arm:   "c186d536e4b31d39edee7744721bcfedef73f99991f99d4e1e845f601f9a42e2",
         intel: "a8688eb55d769bee3f546593261ba7a195890e675f51944debc3d8e8f9595389"

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
