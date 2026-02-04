#!/bin/bash
# Quick Start Script for Luraph Deobfuscation Tools
# Execute this script to run all analysis tools

echo "=========================================="
echo "Luraph Deobfuscation Tools - Quick Start"
echo "=========================================="
echo ""

# Check if Lua is installed
if ! command -v lua5.3 &> /dev/null; then
    echo "❌ Lua 5.3 is not installed!"
    echo "Install with: sudo apt install lua5.3"
    exit 1
fi

echo "✓ Lua 5.3 found"
echo ""

# Run structure analysis
echo "=========================================="
echo "1. Running Structure Analysis..."
echo "=========================================="
lua5.3 analyze_luraph.lua
echo ""

# Run basic deobfuscator
echo "=========================================="
echo "2. Running Basic Deobfuscator..."
echo "=========================================="
lua5.3 deobfuscator.lua
echo ""

# Run advanced deobfuscator
echo "=========================================="
echo "3. Running Advanced Deobfuscator..."
echo "=========================================="
lua5.3 advanced_deobfuscator.lua
echo ""

# Summary
echo "=========================================="
echo "All Tools Executed!"
echo "=========================================="
echo ""
echo "Generated files:"
echo "  - analysis_report.txt"
echo "  - (deobfuscated_output.lua if successful)"
echo ""
echo "Documentation:"
echo "  - LEIAME_PT.md (Português)"
echo "  - DEOBFUSCATION_GUIDE.md (English)"
echo "  - README_DEOBFUSCATION.md"
echo ""
echo "Note: Full automatic deobfuscation is not"
echo "feasible due to Luraph v14.6's VM-based"
echo "protection. See documentation for alternatives."
echo ""
