cask "nyaterm" do
  arch arm: "arm64", intel: "x64"

  version "1.2.0"
  sha256 arm:   "43efb3d169b50e69c8d72bd24504cf34bdde172ebd03589073c406215fab8c5b",
         intel: "eec044e8478292fccb92aa05995c0182ea4eb8fb5d3ee5e8e54b71bf7e4954ef"

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

