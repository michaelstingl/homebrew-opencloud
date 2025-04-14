cask "opencloud-beta" do
  arch arm: "arm64", intel: "x86_64"

  version "1.0.0-rc.1"
  sha256 arm:   "9b97142b7fa207cbb68e5a1926d9dafbd1375e06a5f2336b197f3fdb774a2626",
         intel: "95443b0ea69d40d5916965aa7e3155bd10d048598a942fd9e78c519c1e1cdb7d"

  url "https://github.com/opencloud-eu/desktop/releases/download/v#{version}/OpenCloud_Desktop-v#{version}-macos-clang-#{arch}.pkg"
  name "OpenCloud Desktop Beta"
  desc "Desktop syncing client for OpenCloud (Beta version)"
  homepage "https://github.com/opencloud-eu/desktop"

  livecheck do
    url "https://github.com/opencloud-eu/desktop/releases"
    strategy :github_latest
    regex(/v?(\d+(?:\.\d+)+[-.](?:beta|rc|preview)\.?\d*)/i)
  end

  auto_updates true
  depends_on macos: ">= :monterey"

  pkg "OpenCloud_Desktop-v#{version}-macos-clang-#{arch}.pkg"

  uninstall pkgutil: [
    "eu.opencloud.client",
    "eu.opencloud.finderPlugin",
  ]

  zap trash: [
    "~/Library/Application Scripts/eu.opencloud.desktopclient.FinderSyncExt",
    "~/Library/Application Support/OpenCloud",
    "~/Library/Caches/eu.opencloud.desktopclient",
    "~/Library/Containers/eu.opencloud.desktopclient.FinderSyncExt",
    "~/Library/Group Containers/9B5WD74GWJ.eu.opencloud.desktopclient",
    "~/Library/Preferences/eu.opencloud.desktopclient.plist",
    "~/Library/Preferences/OpenCloud",
  ]

  caveats <<~EOS
    This is a pre-release version of OpenCloud Desktop.
    It might include experimental features and may not be stable for daily use.
  EOS
end