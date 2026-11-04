cask "hexpalace" do
  arch arm: "arm64", intel: "x64"

  version "1.1.7"
  sha256 arm:   "7250eca779fe0c973fc828ba88b3d86f374a504507f8186b67881d1616ddb4fd",
         intel: "bed378f8a134a49f5f0325e5deb90a961236ad38b4f246d2bb0629f8ccd89409"

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
