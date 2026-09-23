cask "macfeel" do
  version "1.0.0"
  sha256 "f6d8037dcff964cbfb11abaf694bf8413cf8c151f9eb0880ecb5c7eb948f03a8"

  url "https://github.com/ttsalpha/macfeel-app/releases/download/v#{version}/MacFeel-#{version}.dmg",
      verified: "github.com/ttsalpha/"
  name "MacFeel"
  desc "Turns your MacBook into a scale, protractor, spirit level and light meter"
  homepage "https://macfeel.ttsalpha.com/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :sonoma"
  depends_on arch: :arm64

  app "MacFeel.app"

  uninstall quit: "com.ttsalpha.macfeel"

  zap trash: [
    "~/Library/Application Support/com.ttsalpha.macfeel",
    "~/Library/Caches/com.ttsalpha.macfeel",
    "~/Library/Preferences/com.ttsalpha.macfeel.plist",
  ]

  caveats <<~EOS
    MacFeel is signed but not notarized, so macOS blocks it on first launch.
    Clear the quarantine flag once:

      xattr -dr com.apple.quarantine /Applications/MacFeel.app

    Slap detection needs Input Monitoring; MacFeel asks on first launch.
  EOS
end
