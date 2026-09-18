cask "overhead" do
  version "1.5.0"
  sha256 "0000000000000000000000000000000000000000000000000000000000000000"  # set by the release workflow

  url "https://github.com/flotttt/Overhead/releases/download/v#{version}/Overhead.zip"
  name "Overhead"
  desc "Control Sony headphones and your music from the menu bar and the notch"
  homepage "https://github.com/flotttt/Overhead"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :ventura

  app "Overhead.app"

  # The app isn't notarized yet: without this, macOS refuses to open it after install.
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/Overhead.app"]
  end

  uninstall quit: "com.semvis123.SonyHeadphonesClient"

  zap trash: [
    "~/Library/Containers/com.semvis123.SonyHeadphonesClient",
    "~/Library/Logs/Overhead",
    "~/Library/Logs/SonyNotch",
  ]
end
