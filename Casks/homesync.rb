cask "homesync" do
  version "1.0.0"
  sha256 "79f98ac8182bbf658eb70af549f4a39850a5ddfbac33529c04e824631b5c259f"

  url "https://github.com/schmidt-gabriel/homesync/releases/download/v#{version}/HomeSync.zip"
  name "HomeSync"
  desc "Menu bar client for syncing files with your own HomeSync server"
  homepage "https://github.com/schmidt-gabriel/homesync"

  depends_on macos: ">= :sonoma"

  app "HomeSync.app"

  # Everything the app creates outside its own bundle, so `brew uninstall --zap`
  # actually leaves the machine as it found it. The login item matters most:
  # SMAppService keys off the bundle identifier, and an orphaned registration
  # cannot be removed from System Settings once the app is gone.
  zap trash: [
        "~/Library/Application Support/HomeSync",
        "~/Library/Caches/dev.schmidt.HomeSync",
        "~/Library/HTTPStorages/dev.schmidt.HomeSync",
        "~/Library/Preferences/dev.schmidt.HomeSync.plist",
      ],
      launchctl: "dev.schmidt.HomeSync"

  caveats <<~EOS
    HomeSync is not signed with an Apple Developer ID, so macOS quarantines it
    and Gatekeeper refuses the first launch. Install without the quarantine
    flag:

      brew install --cask --no-quarantine homesync

    Or clear it afterwards:

      xattr -dr com.apple.quarantine /Applications/HomeSync.app

    The synced folder and the device token are left alone by `brew uninstall`.
    Use `brew uninstall --zap homesync` to remove the app's settings too; that
    still does not touch your files, and the device token stays in the Keychain
    until you revoke it on the server.
  EOS
end
