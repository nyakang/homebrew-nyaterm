cask "nyaterm" do
  arch arm: "arm64", intel: "x64"

  version "1.1.11"
  sha256 arm:   "07383a5fa633ceaee48bde9abd0c9adebdeb5f1b20465c0199709eaa436e80ab",
         intel: "388cf707feb7e2b4868b49c9b9aad7b2dbb8ff05859abd85280936b7549df2c6"

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
  depends_on macos: ">= :monterey"

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

