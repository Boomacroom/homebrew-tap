cask "hexpalace" do
  arch arm: "arm64", intel: "x64"

  version "1.2.0"
  sha256 arm:   "d8258c202b32c22bd75ea8aeb4b4e98564653815df326e7652020a0c4574b29f",
         intel: "6ff8ca25f0149a6cf4bf3f676f95ae66a2a91d1452b3103cecbbe0eb24f53622"

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
