cask "nyaterm" do
  arch arm: "arm64", intel: "x64"

  version "1.1.10"
  sha256 arm:   "a34a237fb1400021b4ba3d3c9ed377846c9de9454b4d387bd98b1aa7b3d3ca66",
         intel: "76891245d5f1801f6a7c91a61397ccfbd22c2341cda2306f9b9a0204d53b9535"

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

