# Homebrew OpenCloud

Homebrew Tap for OpenCloud Desktop.

## How do I install these formulae or casks?

### Casks

#### Stable Version (when available)

`brew install --cask michaelstingl/opencloud/opencloud`

Or `brew tap michaelstingl/opencloud` and then `brew install --cask opencloud`.

#### Beta/Pre-release Version

`brew install --cask michaelstingl/opencloud/opencloud-beta`

Or `brew tap michaelstingl/opencloud` and then `brew install --cask opencloud-beta`.

### Using Brewfile

In a `brew bundle` `Brewfile`:

```ruby
tap "michaelstingl/opencloud"

# For stable version (when available)
cask "opencloud"

# OR for beta/pre-release version
# cask "opencloud-beta"
```

## Testing and Verification

After installation, you can verify the app is working correctly:

### Version Check

```bash
/Applications/OpenCloud.app/Contents/MacOS/opencloud --version
```

Sample output:
```
OpenCloud OpenCloud 1.0.0-rc.3
https://github.com/opencloud-eu/desktop/commit/d3278c3401014fc9f0dc39766e3ab46c77c8c291
Libraries Qt 6.8.1, OpenSSL 3.3.2 3 Sep 2024
Using virtual files plugin: off
OS: macos-24.4.0 (build arch: arm64, CPU arch: arm64)
QPA: cocoa
```

### Debug Mode

For detailed logging output:

```bash
# Verbose HTTP logging to console
OPENCLOUD_HTTP_VERBOSE=1 /Applications/OpenCloud.app/Contents/MacOS/opencloud --logdebug --logfile -
```

### Help Information

```bash
/Applications/OpenCloud.app/Contents/MacOS/opencloud --help
```

### GUI Launch Test

Simply open the app from Applications folder or run:

```bash
open -a OpenCloud
```

## Troubleshooting and Debugging

### Verbose Installation

For more detailed output during installation:

```bash
brew install --cask --verbose opencloud
```

### Debug Mode

To run in debug mode with maximum logging:

```bash
brew install --cask --debug opencloud
```

### Common Issues

1. **Installation fails with SHA256 mismatch**
   - This usually happens when the cask hasn't been updated for a new release
   - Please open an issue with the output of `brew cask fetch opencloud`

2. **System Requirements**
   - OpenCloud Desktop requires macOS Monterey (12) or newer
   - Make sure your system meets these requirements

3. **Upgrade Problems**
   - Always quit the OpenCloud Desktop app before upgrading
   - If upgrades fail, try: `brew uninstall --cask opencloud` followed by a clean install

### Log Locations

- Homebrew logs: `~/Library/Logs/Homebrew/`
- Cask-specific logs: `~/Library/Logs/Homebrew/opencloud/`

## Documentation

`brew help`, `man brew` or check [Homebrew's documentation](https://docs.brew.sh).
