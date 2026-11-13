cask "hexpalace" do
  arch arm: "arm64", intel: "x64"

  version "1.4.2"
  sha256 arm:   "6287b058573f8bf4bb535b09b4adaf2871345fd264f3e4572b850964ca561635",
         intel: "a2195257dda771fadfabd46261e20f0aeb955936c7efa4d1538e1fea47846128"

  url "https://hexpalace.com/dl/HexPalace-#{version}-mac-#{arch}.dmg"
  name "HexPalace"
  desc "Palace chat client"
  homepage "https://hexpalace.com/"

  livecheck do
    url "https://hexpalace.com/dl/latest-mac.yml"
    strategy :electron_builder
  end

  depends_on macos: :monterey

  app "HexPalace.app"

  zap trash: [
    "~/Library/Application Support/HexPalace",
    "~/Library/Logs/HexPalace",
    "~/Library/Preferences/app.hexpalace.desktop.plist",
    "~/Library/Saved Application State/app.hexpalace.desktop.savedState",
  ]

  caveats <<~EOS
    HexPalace isn't notarized by Apple. The first time you open it, macOS
    blocks it: go to System Settings > Privacy & Security and click Open Anyway.
    Update with: brew upgrade --cask hexpalace
  EOS
end
