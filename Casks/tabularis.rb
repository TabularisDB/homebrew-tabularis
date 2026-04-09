cask "tabularis" do
  arch arm: "aarch64", intel: "064c9f73542bb73b7bff63815537b3d8aa5c53f1efec4a80f0e85a80759ead18"

  version "0.9.15"
  sha256 arm:   "f6e088d986a23637ce3301430e77c933ba2a6d7fb941df31eb1d7a8a47dde748",
         intel: "064c9f73542bb73b7bff63815537b3d8aa5c53f1efec4a80f0e85a80759ead18"

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
