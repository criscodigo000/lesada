# Luraph Deobfuscation Project - README

## Overview

This repository contains tools and documentation for analyzing a Lua script obfuscated with Luraph Obfuscator v14.6.

## Files

### Original Obfuscated Script
- **scripts.txt** - The original Luraph v14.6 obfuscated script (78KB)

### Deobfuscation Tools

1. **deobfuscator.lua** - Basic deobfuscation tool using function hooking
2. **advanced_deobfuscator.lua** - Advanced tool with environment manipulation
3. **analyze_luraph.lua** - Structure analysis tool for Luraph scripts

### Documentation

- **DEOBFUSCATION_GUIDE.md** - Comprehensive guide on Luraph obfuscation and deobfuscation techniques
- **analysis_report.txt** - Technical analysis report of the obfuscated script
- **deobfuscated.lua** - Template file with deobfuscation notes

## Quick Start

### Run Structure Analysis
```bash
lua5.3 analyze_luraph.lua
```

### Attempt Deobfuscation
```bash
lua5.3 advanced_deobfuscator.lua
```

## Important Notes

### About Luraph v14.6

Luraph is a professional-grade obfuscator that uses:
- Custom virtual machine execution
- Advanced string compression
- Control flow obfuscation
- Anti-debugging mechanisms

### Deobfuscation Status

❌ **Full automatic deobfuscation: NOT SUCCESSFUL**

The tools provided attempt various deobfuscation techniques, but Luraph v14.6's VM-based execution prevents complete automatic source recovery.

### Analysis Results

✅ **Structure analysis: SUCCESSFUL**
- Obfuscator version: Luraph v14.6
- File size: 78,736 bytes
- Complexity: Very High
- Protection level: Commercial-grade

## Alternative Approaches

Since automatic deobfuscation is not feasible, consider:

1. **Dynamic Analysis** - Monitor the script's behavior at runtime
2. **Manual Reverse Engineering** - Study the VM instruction set
3. **Contact Author** - Request original source code if you have legitimate access
4. **Professional Services** - Hire reverse engineering experts
5. **Behavioral Testing** - Understand what the script does without seeing source

## Usage Guide

### For Security Researchers
Use the analysis tools to understand the obfuscation structure and identify potential security concerns.

### For Script Owners
If you have legitimate access to this script but lost the source:
1. Contact the original developer
2. Check version control systems
3. Review backup systems

### For Learning
Study the tools and documentation to understand:
- How Luraph obfuscation works
- VM-based code protection
- Deobfuscation techniques and limitations

## Legal Notice

⚠️ These tools are for educational and legitimate security research purposes only. Always respect:
- Copyright and intellectual property rights
- Software license agreements
- Legal restrictions on reverse engineering

## Technical Details

### Script Information
- **Obfuscator**: Luraph v14.6 (https://lura.ph/)
- **Language**: Lua 5.3
- **Protection**: VM-based execution with compressed bytecode
- **Complexity**: 17 functions, 48 local variables, 14 loops, 28 conditionals

### Tool Requirements
- Lua 5.3 or higher
- Standard Lua libraries (io, string, debug)

## Conclusion

This project demonstrates that Luraph v14.6 is a highly effective obfuscator that resists automated deobfuscation attempts. The tools provided offer insight into the obfuscation structure but cannot recover the original source code without significant manual reverse engineering effort.

For practical purposes, if you need to understand this script's functionality:
- Focus on behavioral analysis
- Monitor its runtime actions
- Contact the original author if possible

---

## Additional Resources

- **DEOBFUSCATION_GUIDE.md** - Detailed technical guide
- **analysis_report.txt** - Complete analysis results
- Luraph Official Documentation: https://lura.ph/

## License

These deobfuscation tools are provided for educational purposes. Use responsibly and legally.

---

*Created: 2026-02-04*
*Project Status: Analysis Complete, Full Deobfuscation Not Feasible*
