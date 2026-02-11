
[![Discord](https://img.shields.io/discord/1470772941296894128?color=5865F2&logo=discord&logoColor=white)](https://discord.gg/WgsVw69F)

# Homebrew Tabularis

Official Homebrew tap for [Tabularis](https://github.com/debba/tabularis) - A lightweight, developer-focused database management tool.

**Discord** - [Join our discord server](https://discord.gg/WgsVw69F) and chat with the maintainers.

## Installation

```bash
# Add this tap
brew tap debba/tabularis

# Install Tabularis
brew install --cask tabularis
```

## Updates

The Homebrew formula is **automatically updated daily** via GitHub Actions. The workflow:

- Checks for new releases from `debba/tabularis`
- Downloads the latest DMG files (both ARM64 and Intel architectures)
- Calculates SHA256 checksums
- Updates the formula automatically
- Commits and pushes changes

You can also trigger the update manually from the GitHub Actions tab.

## Repository Structure

```
.
├── Casks/
│   └── tabularis.rb          # Homebrew Cask formula
├── scripts/
│   └── update-homebrew-formula.sh  # Update script (used by CI)
├── .github/
│   └── workflows/
│       └── update-formula.yml    # Daily automated update workflow
├── README.md
└── LICENSE
```

## Manual Update

If you need to manually update the formula:

```bash
# Auto-detect latest version
./scripts/update-homebrew-formula.sh

# Or specify a version
./scripts/update-homebrew-formula.sh 0.9.0
```

## Requirements

- macOS 12 (Monterey) or later
- Homebrew installed

## About Tabularis

Tabularis is a modern, lightweight database management tool designed for developers. It provides an intuitive interface for managing multiple database connections with a focus on simplicity and performance.

Visit the main repository: [github.com/debba/tabularis](https://github.com/debba/tabularis)

## License

This repository is licensed under [CC0 1.0 Universal](LICENSE) - you can copy, modify, distribute and perform the work, even for commercial purposes, all without asking permission.

---

<p align="center">Made with ❤️ by <a href="https://github.com/debba">debba</a></p>
