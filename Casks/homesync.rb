cask "homesync" do
  version "1.1.4"
  sha256 "a90a0ad8c02d3563ca5a158f0dea45745677e8ea5f3b0023a4fcb08823e101d6"

  url "https://github.com/schmidt-gabriel/homesync/releases/download/v#{version}/HomeSync.zip"
  name "HomeSync"
  desc "Menu bar client for syncing files with your own HomeSync server"
  homepage "https://github.com/schmidt-gabriel/homesync"

  depends_on macos: :sonoma

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
    HomeSync is not signed with an Apple Developer ID, so macOS attaches a
    quarantine flag to it. Clear it once:

      xattr -dr com.apple.quarantine /Applications/HomeSync.app

    (--no-quarantine is not a command-line flag on current Homebrew, and
    setting it through HOMEBREW_CASK_OPTS did not stop the flag being applied
    either, so the command above is the reliable route.)

    Signing it properly needs a paid Apple Developer account.

    The synced folder and the device token are left alone by `brew uninstall`.
    Use `brew uninstall --zap homesync` to remove the app's settings too; that
    still does not touch your files, and the device token stays in the Keychain
    until you revoke it on the server.
  EOS
end
