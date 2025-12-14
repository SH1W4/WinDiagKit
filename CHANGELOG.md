# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [1.0.0] - 2025-12-14

### Added
- Initial release of Windows System Diagnostic & Optimization Toolkit
- Core diagnostic scripts:
  - `SystemDiagnostic.ps1` - Full system diagnostic with admin privileges
  - `SystemDiagnosticUser.ps1` - User-level diagnostic without admin
  - `SystemDiagnosticSimple.ps1` - Lightweight diagnostic scan
- Storage analysis tools:
  - `ScanStorage.ps1` - Deep storage analysis
  - `ScanTargets.ps1` - Targeted scan for Docker, AppData, node_modules
  - `AnalyzeCursor.ps1` - Cursor editor cache analysis
  - `CheckAppData.ps1` - AppData folder analysis
- Cleanup scripts:
  - `AdditionalCleanup.ps1` - Safe cleanup (browser caches, downloads, temp)
  - `ExecuteCleanup.ps1` - Standard cleanup (Cursor backup, Docker, temp)
  - `ExecuteTotalCleanup.ps1` - Aggressive cleanup including Anaconda
  - `PostRebootCleanup.ps1` - Post-reboot optimization tasks
- Utility scripts:
  - `check_environment.ps1` - Verify development tools installation
  - `setup_environment.ps1` - Configure diagnostic environment
  - `verify_environment.ps1` - Validate setup
- Documentation:
  - Comprehensive README.md with usage examples
  - CONTRIBUTING.md with development guidelines
  - MIT License
  - Detailed inline documentation in all scripts

### Features
- **Safe & Non-Destructive:** Preserves user data and development environments
- **Detailed Logging:** All actions logged to timestamped files
- **Modular Design:** Use individual scripts or complete workflow
- **No Admin Required:** Most scripts work without elevation
- **Smart Cleanup:** Identifies and removes:
  - Duplicate Cursor backups (6.5 GB typical)
  - Unused Docker images and containers (20-25 GB typical)
  - Browser caches (4-6 GB typical)
  - Old installers in Downloads (2-3 GB typical)
  - Anaconda/Conda distributions (9-10 GB typical)
  - Temporary files and caches (1-2 GB typical)

### Real-World Results
- Successfully recovered 19.7 GB (+82% increase) on development machine
- Reduced disk usage from critical 5% to healthy 9.2%
- Preserved all development data and configurations
- Improved system responsiveness

### Known Limitations
- Windows-only (PowerShell-based)
- Some cleanup operations require administrator privileges
- Hibernation disable requires admin rights
- VSS (Volume Shadow Copy) operations require admin rights

## [Unreleased]

### Planned
- Linux/macOS versions of diagnostic scripts
- GUI wrapper for easier use
- Automated scheduled diagnostics
- JSON/CSV export for reports
- Integration with monitoring tools
- Machine learning-based cleanup recommendations

---

## Version History

### Version Numbering
- **Major (X.0.0):** Breaking changes, major new features
- **Minor (0.X.0):** New features, backward compatible
- **Patch (0.0.X):** Bug fixes, minor improvements

### Support
- Latest version: Full support
- Previous major version: Security fixes only
- Older versions: Community support only
