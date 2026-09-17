cask "sonynotch" do
  version "1.2.2"
  sha256 "d7a70638afc05260f2e8ee6d6cc97af23acf696e5528b3107768b5ab1d7ea266"

  url "https://github.com/flotttt/SonyNotch/releases/download/v1.2.2/SonyNotch.zip"
  name "SonyNotch"
  desc "Control Sony headphones from the menu bar and the notch"
  homepage "https://github.com/flotttt/SonyNotch"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :ventura

  app "SonyNotch.app"

  # The app isn't notarized yet: without this, macOS refuses to open it after install.
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/SonyNotch.app"]
  end

  uninstall quit: "com.semvis123.SonyHeadphonesClient"

  zap trash: [
    "~/Library/Containers/com.semvis123.SonyHeadphonesClient",
    "~/Library/Logs/SonyNotch",
  ]
end
