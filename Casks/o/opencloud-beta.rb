cask "opencloud-beta" do
  arch arm: "arm64", intel: "x86_64"

  version "1.0.0-rc.3"
  sha256 arm:   "d4706f83df677267218978acf434eb359f7a775552f27b54cf51e8f7b3e0a253",
         intel: "ce65d35cd860e5ae2412d589f3f78060b3a0bef383bb9fad0da7866b14691ebc"

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
    "eu.opencloud.desktop",
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
