cask "hexpalace" do
  arch arm: "arm64", intel: "x64"

  version "1.4.1"
  sha256 arm:   "ffff714f2c27517cb749d72db207168f53dd37f0ca37458a1b240933d076ce89",
         intel: "fae2b94e7efe6c332a4a49145256982943989ef4f5fefceee022dd8bda62d447"

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
