cask "nyaterm" do
  arch arm: "arm64", intel: "x64"

  version "1.2.6"
  sha256 arm:   "76d78c18e6eb1bf3339610b1d5202a5cca6e44caacea23dc22bb7c6c6bc11c14",
         intel: "09dd0db223acf59cd03eb2779fadb9174b20bc766a7791ece5943412364f6821"

  url "https://github.com/nyakang/nyaterm/releases/download/v#{version}/NyaTerm_#{version}_macos_#{arch}.dmg",
      verified: "github.com/nyakang/nyaterm/"
  name "NyaTerm"
  desc "Modern remote terminal workspace"
  homepage "https://nyaterm.app/"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on macos: :monterey

  app "NyaTerm.app"

  zap trash: [
    "~/Library/Application Support/com.kang.nyaterm",
    "~/Library/Application Support/NyaTerm",
    "~/Library/Caches/com.kang.nyaterm",
    "~/Library/Logs/com.kang.nyaterm",
    "~/Library/Logs/NyaTerm",
    "~/Library/Preferences/com.kang.nyaterm.plist",
    "~/Library/Saved Application State/com.kang.nyaterm.savedState",
  ]
end

