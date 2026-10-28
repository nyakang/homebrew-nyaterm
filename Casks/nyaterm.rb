cask "nyaterm" do
  arch arm: "arm64", intel: "x64"

  version "2.0.0"
  sha256 arm:   "9dc6d807c5af7b77f846464d179c8ed591f72688f98d334a78e2287fc997aa5c",
         intel: "956b6d64a9548f624b8bd296afc4762c056320d58f586bc00954d207bb654067"

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

