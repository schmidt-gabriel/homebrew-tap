cask "homesync" do
  version "1.0.3"
  sha256 "d48a78d690798e520ee8068be614fc8d00da6f6737c9c281f38f8c6d946cad85"

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
