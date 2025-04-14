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
