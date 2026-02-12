cask "tabularis" do
  arch arm: "aarch64", intel: "0392ae97901322d0e2618b28d66b8ce65729655b3f1ea15c6f2f45f1cd114466"

  version "0.8.12"
  sha256 arm:   "186e35aec380a68b84e87a840eaef28e364ddabc3702abff3be85cae62978c54",
         intel: "0392ae97901322d0e2618b28d66b8ce65729655b3f1ea15c6f2f45f1cd114466"

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
