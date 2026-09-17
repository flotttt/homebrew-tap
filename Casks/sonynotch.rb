cask "sonynotch" do
  version "1.1.0"
  sha256 "46e1ca5c5edf50a61338cde32ddc2b34ed447a42afc79452cf0d3afa41a53299"

  url "https://github.com/flotttt/SonyNotch/releases/download/v#{version}/SonyNotch.zip"
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
