cask "nyaterm" do
  arch arm: "arm64", intel: "x64"

  version "2.0.8"
  sha256 arm:   "2d7fe1c3e8ed760c726980ca0157ea722c7674503aa5eaf7ea2b00c40c8d504d",
         intel: "633da6e808de6bbd5ddaa46a7527cbbfcc41301c63f5f8dbd9cfe90e926b0e85"

  url "https://github.com/nyakang/nyaterm/releases/download/v#{version}/NyaTerm_#{version}_macos_#{arch}.dmg"
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

