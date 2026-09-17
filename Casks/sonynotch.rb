cask "sonynotch" do
  version "1.2.0"
  sha256 "2502428138b0b064895166c374027b6d6a17d9e52521cbf7daa6349bbe9ab69d"

  url "https://github.com/flotttt/SonyNotch/releases/download/v1.2.0/SonyNotch.zip"
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
