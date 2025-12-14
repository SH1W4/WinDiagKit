# Contributing to Windows System Diagnostic & Optimization Toolkit

First off, thank you for considering contributing to this project! This toolkit was born from a real-world crisis and has already helped recover critical disk space. Your contributions can help many more people.

## 🎯 How Can I Contribute?

### Reporting Bugs

Before creating bug reports, please check existing issues. When creating a bug report, include:

- **Windows Version:** (e.g., Windows 11 22H2)
- **PowerShell Version:** Run `$PSVersionTable.PSVersion`
- **Script Name:** Which script encountered the issue
- **Expected Behavior:** What you expected to happen
- **Actual Behavior:** What actually happened
- **Error Messages:** Full error text from console/logs
- **Steps to Reproduce:** Detailed steps to reproduce the issue

### Suggesting Enhancements

Enhancement suggestions are tracked as GitHub issues. When creating an enhancement suggestion, include:

- **Use Case:** Describe the problem you're trying to solve
- **Proposed Solution:** Your idea for how to solve it
- **Alternatives Considered:** Other approaches you've thought about
- **Additional Context:** Screenshots, examples, etc.

### Pull Requests

1. **Fork the repo** and create your branch from `main`
2. **Test your changes** thoroughly on a Windows machine
3. **Update documentation** if you're adding/changing functionality
4. **Follow the coding style** used in existing scripts
5. **Write clear commit messages**
6. **Submit the PR** with a clear description

## 💻 Development Setup

```powershell
# Clone your fork
git clone https://github.com/YOUR_USERNAME/windows-diagnostic-toolkit.git
cd windows-diagnostic-toolkit

# Create a branch for your feature
git checkout -b feature/your-feature-name

# Make your changes and test them
# ...

# Commit your changes
git add .
git commit -m "Add: Brief description of your changes"

# Push to your fork
git push origin feature/your-feature-name
```

## 📝 Coding Guidelines

### PowerShell Style

- Use **PascalCase** for function names
- Use **camelCase** for variables
- Include **comment blocks** for complex logic
- Add **error handling** with try/catch
- Use **Write-Log** function for output (see existing scripts)
- Include **parameter validation** where appropriate

### Example:

```powershell
function Get-LargeFiles {
    param(
        [Parameter(Mandatory=$true)]
        [string]$Path,
        
        [Parameter(Mandatory=$false)]
        [int]$MinSizeMB = 100
    )
    
    try {
        Write-Log "Scanning for files larger than $MinSizeMB MB in $Path"
        
        Get-ChildItem $Path -Recurse -File -ErrorAction SilentlyContinue |
            Where-Object { $_.Length -gt ($MinSizeMB * 1MB) } |
            Sort-Object Length -Descending
            
        Write-Log "Scan completed successfully"
    }
    catch {
        Write-Log "Error during scan: $_" -Type "ERROR"
    }
}
```

### Documentation

- **README.md:** Update if adding new scripts or features
- **Inline Comments:** Explain *why*, not *what* (code shows what)
- **Function Headers:** Include purpose, parameters, and return values
- **Examples:** Provide usage examples for new features

## 🧪 Testing

Before submitting a PR:

1. **Test on clean system:** If possible, test on a fresh Windows install
2. **Test error cases:** Try invalid inputs, missing files, etc.
3. **Check logs:** Ensure logging is clear and helpful
4. **Verify cleanup:** If it's a cleanup script, verify it doesn't delete important data
5. **Test without admin:** Verify scripts work without elevation (if designed to)

## 🎨 Project Structure

```
DIAGNOSTIC_BACKUP/
├── README.md                      # Main documentation
├── LICENSE                        # MIT License
├── CONTRIBUTING.md               # This file
│
├── Core Diagnostic/
│   ├── SystemDiagnostic.ps1      # Full diagnostic (admin)
│   ├── SystemDiagnosticUser.ps1  # User-level diagnostic
│   └── SystemDiagnosticSimple.ps1 # Lightweight scan
│
├── Analysis/
│   ├── ScanStorage.ps1           # Storage analysis
│   ├── ScanTargets.ps1           # Targeted scans
│   ├── AnalyzeCursor.ps1         # Cursor-specific
│   └── CheckAppData.ps1          # AppData analysis
│
├── Cleanup/
│   ├── AdditionalCleanup.ps1     # Safe cleanup
│   ├── ExecuteCleanup.ps1        # Standard cleanup
│   ├── ExecuteTotalCleanup.ps1   # Aggressive cleanup
│   └── PostRebootCleanup.ps1     # Post-reboot tasks
│
├── Utilities/
│   ├── check_environment.ps1     # Environment check
│   ├── setup_environment.ps1     # Setup helper
│   └── verify_environment.ps1    # Verification
│
└── Documentation/
    ├── SETUP.md                  # Setup guide
    ├── NEXT_STEPS.md            # Next steps
    └── Reports/                  # Generated reports
```

## 🏷️ Commit Message Guidelines

Use clear, descriptive commit messages:

- **Add:** New feature or script
- **Fix:** Bug fix
- **Update:** Modify existing functionality
- **Docs:** Documentation changes
- **Refactor:** Code restructuring without behavior change
- **Test:** Adding or updating tests

Examples:
```
Add: Browser cache cleanup to AdditionalCleanup.ps1
Fix: Handle missing Docker installation gracefully
Update: Improve error messages in SystemDiagnostic.ps1
Docs: Add troubleshooting section to README
```

## 🌟 Feature Ideas

Looking for contribution ideas? Here are some:

### High Priority
- [ ] Add Linux/macOS versions of diagnostic scripts
- [ ] Create automated tests
- [ ] Add GitHub Actions CI/CD
- [ ] Improve error handling across all scripts

### Medium Priority
- [ ] GUI wrapper using Windows Forms
- [ ] Scheduled task automation
- [ ] Export reports to JSON/CSV
- [ ] Integration with Windows Event Log

### Nice to Have
- [ ] Machine learning for cleanup recommendations
- [ ] Multi-language support
- [ ] Cloud backup integration warnings
- [ ] Performance benchmarking

## 📞 Questions?

- **General Questions:** Open a GitHub Discussion
- **Bug Reports:** Open a GitHub Issue
- **Security Issues:** Email directly (don't open public issue)

## 🙏 Recognition

Contributors will be recognized in:
- README.md contributors section
- Release notes
- Project documentation

Thank you for helping make Windows system maintenance easier for everyone! 🎉
