cask "hexpalace" do
  arch arm: "arm64", intel: "x64"

  version "1.4.6"
  sha256 arm:   "64013f8c9296e02ce0dcd8d14fd8c9e031aa66e1ac74ba823b2f7b29cc9d6fa5",
         intel: "1623e7132cf09a7f44bb8e3716499e4df6936c2eeb3475d3c68e98c6ba92a2cf"

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
