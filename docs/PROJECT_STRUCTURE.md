# 📁 Project Structure

This document explains the organization of the Windows System Diagnostic & Optimization Toolkit.

## Directory Layout

```
windows-diagnostic-toolkit/
│
├── 📄 README.md                    # Main documentation
├── 📄 LICENSE                      # MIT License
├── 📄 CONTRIBUTING.md             # Contribution guidelines
├── 📄 CHANGELOG.md                # Version history
├── 📄 .gitignore                  # Git ignore rules
│
├── 📁 scripts/                    # All PowerShell scripts
│   │
│   ├── 📁 diagnostic/             # System diagnostic scripts
│   │   ├── SystemDiagnostic.ps1          # Full diagnostic (admin)
│   │   ├── SystemDiagnosticUser.ps1      # User-level diagnostic
│   │   └── SystemDiagnosticSimple.ps1    # Lightweight scan
│   │
│   ├── 📁 analysis/               # Storage & system analysis
│   │   ├── ScanStorage.ps1               # Deep storage analysis
│   │   ├── ScanTargets.ps1               # Targeted scans
│   │   ├── ScanPrograms.ps1              # Program Files analysis
│   │   ├── AnalyzeCursor.ps1             # Cursor editor analysis
│   │   ├── CheckAppData.ps1              # AppData analysis
│   │   ├── CheckAppDataRoaming.ps1       # Roaming data analysis
│   │   └── CheckUserRoot.ps1             # User root analysis
│   │
│   ├── 📁 cleanup/                # Cleanup & optimization
│   │   ├── AdditionalCleanup.ps1         # Safe cleanup (no admin)
│   │   ├── ExecuteCleanup.ps1            # Standard cleanup
│   │   ├── ExecuteTotalCleanup.ps1       # Aggressive cleanup
│   │   └── PostRebootCleanup.ps1         # Post-reboot tasks
│   │
│   └── 📁 utils/                  # Utility scripts
│       ├── check_environment.ps1         # Environment verification
│       ├── setup_environment.ps1         # Setup helper
│       ├── verify_environment.ps1        # Validation
│       ├── RunDiagnostic.ps1            # Diagnostic runner
│       └── RunDiagnosticSimple.ps1      # Simple runner
│
├── 📁 docs/                       # Documentation
│   ├── SETUP.md                          # Setup guide
│   ├── USAGE.md                          # Usage examples
│   ├── TROUBLESHOOTING.md               # Common issues
│   └── CASE_STUDIES.md                  # Real-world examples
│
└── 📁 examples/                   # Example outputs
    ├── sample_diagnostic_report.txt
    ├── sample_cleanup_log.txt
    └── before_after_comparison.md
```

## Script Categories

### 🔍 Diagnostic Scripts (`scripts/diagnostic/`)
Scripts that analyze system health and generate reports.

**When to use:**
- Before major system changes
- When experiencing performance issues
- Regular system health checks

### 📊 Analysis Scripts (`scripts/analysis/`)
Scripts that identify specific storage or configuration issues.

**When to use:**
- Investigating disk space usage
- Finding large files or folders
- Analyzing application data

### 🧹 Cleanup Scripts (`scripts/cleanup/`)
Scripts that remove unnecessary files and optimize storage.

**When to use:**
- After analysis identifies cleanup opportunities
- When disk space is low
- As part of regular maintenance

### 🛠️ Utility Scripts (`scripts/utils/`)
Helper scripts for environment setup and validation.

**When to use:**
- Initial setup
- Verifying prerequisites
- Automating diagnostic workflows

## File Naming Conventions

- **PascalCase:** For all script files (e.g., `SystemDiagnostic.ps1`)
- **Descriptive names:** Clear indication of purpose
- **Consistent prefixes:**
  - `System*` - System-wide operations
  - `Scan*` - Analysis operations
  - `Check*` - Verification operations
  - `Execute*` - Action operations

## Output Locations

### Generated Reports
- **Location:** Script execution directory
- **Format:** `[ScriptName]_Report_[timestamp].txt`
- **Example:** `SystemDiagnostic_Report_2025-12-14_11-18-30.txt`

### Log Files
- **Location:** Script execution directory
- **Format:** `[Operation]_LOG.txt`
- **Example:** `CLEANUP_LOG.txt`

### Results Directory
- **Location:** `./RESULTS/` (if created)
- **Contents:** Historical diagnostic outputs

## Best Practices

### For Users
1. **Keep scripts together:** Don't separate script categories
2. **Review logs:** Always check generated logs after operations
3. **Backup reports:** Save diagnostic reports for comparison
4. **Use version control:** Track changes to your local modifications

### For Contributors
1. **Follow structure:** Place new scripts in appropriate category
2. **Update README:** Document new scripts in main README
3. **Add examples:** Provide usage examples in docs
4. **Test thoroughly:** Verify scripts in clean environment

## Migration from Old Structure

If you have the old flat structure, here's how to migrate:

```powershell
# Create new structure
.\scripts\utils\setup_environment.ps1

# Scripts will be organized automatically
# Or manually move:
Move-Item SystemDiagnostic*.ps1 scripts\diagnostic\
Move-Item Scan*.ps1 scripts\analysis\
Move-Item Execute*.ps1 scripts\cleanup\
Move-Item check_*.ps1 scripts\utils\
```

## Quick Reference

| Task | Script Location |
|------|----------------|
| Run full diagnostic | `scripts/diagnostic/SystemDiagnostic.ps1` |
| Quick health check | `scripts/diagnostic/SystemDiagnosticUser.ps1` |
| Find large files | `scripts/analysis/ScanStorage.ps1` |
| Clean browser caches | `scripts/cleanup/AdditionalCleanup.ps1` |
| Full cleanup | `scripts/cleanup/ExecuteTotalCleanup.ps1` |
| Verify environment | `scripts/utils/check_environment.ps1` |
