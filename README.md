# 🔧 WinDiagKit

> A comprehensive PowerShell toolkit for diagnosing, analyzing, and optimizing Windows systems. Born from real-world necessity to rescue a critically low disk space situation.

[![PowerShell](https://img.shields.io/badge/PowerShell-5.1%2B-blue.svg)](https://github.com/PowerShell/PowerShell)
[![License](https://img.shields.io/badge/license-MIT-green.svg)](LICENSE)
[![Platform](https://img.shields.io/badge/platform-Windows-lightgrey.svg)](https://www.microsoft.com/windows)
[![Version](https://img.shields.io/badge/version-1.0.0-brightgreen.svg)](CHANGELOG.md)

## 📋 Table of Contents

- [Overview](#overview)
- [Features](#features)
- [Quick Start](#quick-start)
- [Scripts Documentation](#scripts-documentation)
- [Use Cases](#use-cases)
- [Requirements](#requirements)
- [Installation](#installation)
- [Contributing](#contributing)
- [License](#license)

## 🎯 Overview

**WinDiagKit** (Windows Diagnostic Kit) is a collection of PowerShell scripts designed to diagnose and optimize Windows systems. It was created during a critical disk space crisis (5% free space) on a Windows 11 development machine and successfully recovered **19.7 GB** (+82% increase) through systematic diagnosis and intelligent cleanup.

**What makes WinDiagKit different:**
- ✅ **Safe & Non-Destructive:** Preserves user data and development environments
- ✅ **Modular Design:** Use individual scripts or the complete workflow
- ✅ **Detailed Logging:** Every action is logged for transparency
- ✅ **No Admin Required:** Most scripts work without elevation (admin scripts clearly marked)
- ✅ **Developer-Friendly:** Understands Docker, Node.js, Python, and other dev tools

## ✨ Features

### 🔍 Diagnostic Tools
- **System Health Check:** CPU, RAM, Disk, Services, Network
- **Storage Analysis:** Identify space hogs across the entire system
- **Docker Analysis:** Detect unused images, containers, and volumes
- **Development Environment Audit:** Check installed tools (Git, Python, Node, Docker, etc.)
- **Performance Monitoring:** Track resource usage and identify bottlenecks

### 🧹 Cleanup Tools
- **Smart Cache Cleanup:** Browser caches, user caches, temp files
- **Docker Optimization:** Remove dangling images and stopped containers
- **Installer Removal:** Clean up old setup files in Downloads
- **Anaconda/Conda Cleanup:** Remove unused Python distributions
- **Cursor/VSCode Cache:** Clean editor caches while preserving settings
- **Recycle Bin Management:** Automated cleanup of deleted files

### 📊 Reporting
- Detailed markdown reports with actionable recommendations
- Before/after comparisons
- Categorized issues by severity
- Clear next steps and prioritization

## 🚀 Quick Start

### Option 1: Clone the Repository
```powershell
git clone https://github.com/SH1W4/WinDiagKit.git
cd WinDiagKit
```

### Option 2: Download ZIP
1. Download the latest release
2. Extract to a folder
3. Open PowerShell in that folder

### Basic Usage

#### 1. Quick Health Check (No Admin Required)
```powershell
.\scripts\diagnostic\SystemDiagnosticUser.ps1
```

#### 2. Full Diagnostic (Requires Admin)
```powershell
# Run PowerShell as Administrator
.\scripts\diagnostic\SystemDiagnostic.ps1
```

#### 3. Safe Cleanup
```powershell
# Cleans browser caches, downloads, temp files
.\scripts\cleanup\AdditionalCleanup.ps1
```

## 📚 Scripts Documentation

### Core Diagnostic Scripts

| Script | Purpose | Admin Required | Typical Output |
|--------|---------|----------------|----------------|
| `SystemDiagnostic.ps1` | Complete system analysis | ✅ Yes | 50-100 line detailed report |
| `SystemDiagnosticUser.ps1` | Basic diagnostic | ❌ No | Quick health check |
| `SystemDiagnosticSimple.ps1` | Lightweight scan | ❌ No | Essential metrics only |

### Analysis Scripts

| Script | Purpose | What It Finds |
|--------|---------|---------------|
| `ScanStorage.ps1` | Deep storage analysis | Large folders in user directory |
| `ScanTargets.ps1` | Targeted scan | Docker, AppData, node_modules |
| `AnalyzeCursor.ps1` | Cursor editor analysis | Cache and backup files |
| `CheckAppData.ps1` | AppData scanner | Large application data |

### Cleanup Scripts

| Script | What It Cleans | Typical Gain | Admin Required |
|--------|----------------|--------------|----------------|
| `AdditionalCleanup.ps1` | Browser caches, Downloads, Temp | 3-8 GB | ❌ No |
| `ExecuteCleanup.ps1` | Cursor backup, Docker, Temp | 6-10 GB | ❌ No |
| `ExecuteTotalCleanup.ps1` | Full cleanup + Anaconda | 15-25 GB | ⚠️ Partial |
| `PostRebootCleanup.ps1` | Post-reboot optimization | 3-5 GB | ✅ Yes |

## 💡 Use Cases

### Scenario 1: "My Disk is Almost Full!"
```powershell
# 1. Diagnose the problem
.\scripts\diagnostic\SystemDiagnosticUser.ps1

# 2. Run safe cleanup
.\scripts\cleanup\AdditionalCleanup.ps1

# 3. Check results
Get-Volume -DriveLetter C
```

### Scenario 2: "Docker is Eating My Disk"
```powershell
# 1. Check Docker usage
docker system df

# 2. Clean Docker safely
.\scripts\cleanup\ExecuteCleanup.ps1

# 3. Aggressive cleanup (if needed)
docker system prune -a -f
```

### Scenario 3: "System Performance Check"
```powershell
# Full diagnostic (run as admin)
.\scripts\diagnostic\SystemDiagnostic.ps1

# Review the generated report
# Location: .\SystemDiagnostic_Report_[timestamp].txt
```

## 📋 Requirements

- **OS:** Windows 10/11
- **PowerShell:** 5.1 or higher (PowerShell 7+ recommended)
- **Execution Policy:** Set to allow script execution
  ```powershell
  Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
  ```

### Optional Dependencies
- **Docker Desktop:** For Docker-related features
- **Git:** For version control
- **Administrator Rights:** Required for some operations

## 📦 Installation

### Method 1: Git Clone (Recommended)
```powershell
git clone https://github.com/SH1W4/WinDiagKit.git
cd WinDiagKit
```

### Method 2: Manual Download
1. Download ZIP from GitHub
2. Extract to desired location
3. Unblock files if needed:
   ```powershell
   Get-ChildItem -Recurse | Unblock-File
   ```

### Method 3: PowerShell Gallery (Coming Soon)
```powershell
Install-Module -Name WinDiagKit
```

## 📊 Real-World Results

**Case Study: Development Machine Rescue**

| Metric | Before | After | Improvement |
|--------|--------|-------|-------------|
| Free Space | 24 GB (5%) | 43.7 GB (9.2%) | +82% |
| Cursor Cache | 13 GB | 0 GB | -13 GB |
| Docker | 25 GB | 0.3 GB | -24.7 GB |
| Anaconda | 9.4 GB | 0 GB | -9.4 GB |
| Browser Caches | 6.3 GB | 0 GB | -6.3 GB |
| **Total Recovered** | - | - | **19.7 GB** |

## 🛡️ Safety Features

1. **Dry-Run Logs:** All scripts log actions before executing
2. **Selective Cleanup:** You choose what to clean
3. **Backup Preservation:** Never touches original data, only caches/backups
4. **Reversible Actions:** Most cleanups can be undone (caches rebuild automatically)
5. **Error Handling:** Graceful failures with detailed error messages

## ⚠️ Important Notes

### About Username Changes
**We DO NOT recommend changing Windows username folders.** See [DEPRECATED_USERNAME_CHANGE.md](docs/DEPRECATED_USERNAME_CHANGE.md) for details on why this is risky and what alternatives exist.

### About Hibernation
Disabling hibernation (`powercfg -h off`) is safe and can free 3-4 GB. You can always re-enable it later with `powercfg -h on`.

## 🤝 Contributing

Contributions are welcome! See [CONTRIBUTING.md](CONTRIBUTING.md) for guidelines.

### Quick Contribution Guide
1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Test thoroughly
5. Submit a pull request

## 📝 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgments

- Created during a critical disk space crisis on a Windows 11 development machine
- Inspired by the need for safe, intelligent system optimization
- Built with the philosophy: "Optimize at the root, preserve what matters"

## 📞 Support

- **Issues:** [GitHub Issues](https://github.com/SH1W4/WinDiagKit/issues)
- **Discussions:** [GitHub Discussions](https://github.com/SH1W4/WinDiagKit/discussions)
- **Documentation:** [docs/](docs/)

## 🗺️ Roadmap

- [ ] Linux/macOS versions
- [ ] GUI wrapper
- [ ] Scheduled diagnostics
- [ ] Cloud integration
- [ ] Machine learning recommendations
- [ ] PowerShell Gallery publication

---

**⚠️ Disclaimer:** Always backup important data before running cleanup scripts. While these tools are designed to be safe, system configurations vary. Review logs and understand what each script does before execution.

**Made with ❤️ for developers who need their disk space back**

**Repository:** [github.com/SH1W4/WinDiagKit](https://github.com/SH1W4/WinDiagKit)
