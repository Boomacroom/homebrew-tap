cask "hexpalace" do
  arch arm: "arm64", intel: "x64"

  version "1.4.0"
  sha256 arm:   "5657449afadbfb9b7dca5fc9f706edd94f36fa66d839b7101e657e6c21373c55",
         intel: "34d23d93c1df68d35bbd2d232971a7c4d8635d4073f5912d896b44bf2ea18f21"

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
