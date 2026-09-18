cask "sonynotch" do
  version "1.4.0"
  sha256 "9cc3e4dce7693217e8a6d2efa0b948bb531dfee150b9be40e5752052b8ab8785"

  url "https://github.com/flotttt/SonyNotch/releases/download/v1.4.0/SonyNotch.zip"
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
