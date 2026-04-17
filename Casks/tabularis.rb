cask "tabularis" do
  arch arm: "aarch64", intel: "ebebc61f11d50aa62193db4959c32233c93ae92cb17f7ec2f9686e36257fdffb"

  version "0.9.19"
  sha256 arm:   "89a87ddbaddecfb1dc23aa5c5881aa388d14b4d41ec5e8f28e9c3f81369dfe89",
         intel: "ebebc61f11d50aa62193db4959c32233c93ae92cb17f7ec2f9686e36257fdffb"

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
