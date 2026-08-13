cask "nyaterm" do
  arch arm: "arm64", intel: "x64"

  version "1.2.3"
  sha256 arm:   "88ee520ac7f63534869a7aa11bf41fca532a8c5f0924e56e485415def90f21b0",
         intel: "9c0c20d7f36d701c694da79f97bfe84986a53855e39a50d55d215eb007eb612b"

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

