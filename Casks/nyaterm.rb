cask "nyaterm" do
  arch arm: "arm64", intel: "x64"

  version "2.0.4"
  sha256 arm:   "1f062f5cd82e1fc3da188cc8c0848a3c8c9bc4c43d24450f553af5dc81227de6",
         intel: "02a599a8bd7074f17a1333da58203f5447d82bdedca4e6cac2c145ad12db696d"

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

