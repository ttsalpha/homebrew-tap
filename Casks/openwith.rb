cask "openwith" do
  version "1.0.0"
  sha256 "42fed71e7cf6012b58b3b421d26d2f82eda8d73b48c6210646e6a038d2180b36"

  url "https://github.com/ttsalpha/openwith-app/releases/download/v#{version}/OpenWith-#{version}.dmg"
  name "OpenWith"
  desc "Browser picker that opens at the pointer for every link"
  homepage "https://github.com/ttsalpha/openwith-app"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :sonoma

  app "OpenWith.app"

  uninstall quit: "com.ttsalpha.openwith"

  zap trash: [
    "~/Library/Caches/com.ttsalpha.openwith",
    "~/Library/Preferences/com.ttsalpha.openwith.plist",
  ]

  caveats <<~EOS
    OpenWith is ad-hoc signed and not notarized, so macOS blocks it on first
    launch. Clear the quarantine flag once:

      xattr -dr com.apple.quarantine /Applications/OpenWith.app

    Links only reach OpenWith once it is the default browser: open it and pick
    Set as Default Browser from the menu bar item. Restore the previous browser
    from its Settings before uninstalling, or web links are left without one.
  EOS
end
