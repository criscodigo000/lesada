# Luraph Script Deobfuscation Guide

## Overview
This repository contains a Lua script (`scripts.txt`) that has been obfuscated using **Luraph Obfuscator v14.6**.

## What is Luraph?
Luraph is a commercial-grade Lua obfuscator (https://lura.ph/) that uses advanced techniques to protect Lua source code from reverse engineering. Version 14.6 includes:

- **Custom Virtual Machine (VM)**: The code runs on a custom bytecode interpreter
- **String Compression**: All strings are compressed using a proprietary algorithm
- **Control Flow Obfuscation**: The execution flow is heavily obfuscated
- **Constant Encryption**: Constants are encrypted and decoded at runtime
- **Anti-Tamper Protection**: Includes checks to detect debugging and modification

## Obfuscation Analysis

### Structure
The obfuscated script has the following structure:

```lua
-- This file was protected using Luraph Obfuscator v14.6
return(function()
    -- VM initialization code
    -- String decompression functions
    -- Bytecode interpreter
    -- Encrypted bytecode and data
end)()
```

### Key Components Identified

1. **String Table**: Compressed string data starting with specific patterns
2. **VM Instructions**: Custom bytecode that gets interpreted
3. **Decompression Layer**: Multiple levels of decompression
4. **Execution Layer**: Final layer that executes the actual Lua code

## Deobfuscation Attempts

### Automatic Tools
Several deobfuscation tools were created:

1. **deobfuscator.lua**: Basic hook-based deobfuscator
2. **advanced_deobfuscator.lua**: Advanced environment hooking

These tools attempt to capture the deobfuscated code by hooking into Lua's `loadstring`/`load` functions.

### Results
The automatic deobfuscation tools were unable to fully extract the source code because:
- Luraph v14.6 doesn't use standard `loadstring` for final execution
- The code uses direct VM execution without exposing the original source
- Anti-debugging mechanisms prevent simple hooking

## Manual Deobfuscation Methods

### Method 1: Dynamic Analysis
```lua
-- Modify the obfuscated script to dump its state at runtime
-- This requires editing the VM code to print intermediate values
```

### Method 2: VM Reverse Engineering
Steps:
1. Identify the VM instruction handlers
2. Map VM opcodes to Lua operations
3. Extract the bytecode
4. Convert bytecode back to Lua source

### Method 3: Memory Dump
Use a Lua debugger or memory inspection tool to:
1. Break when the code is being executed
2. Dump the actual Lua functions from memory
3. Use `string.dump` or similar to extract bytecode

### Method 4: Professional Tools
Consider using:
- Commercial deobfuscation services
- Advanced debugging tools (IDA Pro with Lua plugins)
- Custom VM emulators

## Alternative Approaches

### 1. Contact the Author
If you have legitimate access to this script, contact the original author for the source code.

### 2. Behavioral Analysis
Instead of deobfuscating, analyze what the script does:
- Monitor file system operations
- Track network requests
- Log function calls

### 3. Rewrite from Scratch
If you understand the script's functionality, consider rewriting it cleanly.

## Legal and Ethical Considerations

⚠️ **Important**: Deobfuscation should only be performed on code you own or have explicit permission to analyze.

- Luraph is designed to protect intellectual property
- Unauthorized deobfuscation may violate license agreements
- Use these tools only for legitimate purposes (security research, your own code, etc.)

## Tools Provided

### deobfuscated.lua
A template file with notes about the obfuscation structure.

### deobfuscator.lua
Basic deobfuscation tool that attempts to hook execution.

### advanced_deobfuscator.lua
More sophisticated tool with environment manipulation.

### This Guide
Comprehensive information about the obfuscation and deobfuscation approaches.

## Technical Specifications

- **Original File**: scripts.txt
- **Size**: ~77 KB
- **Lines**: 3 (heavily compressed)
- **Obfuscator**: Luraph v14.6
- **Protection Level**: Very High
- **VM Type**: Custom bytecode interpreter

## Next Steps

1. **If you own this code**: Use the original source if available
2. **For security research**: Use dynamic analysis and memory inspection
3. **For understanding**: Focus on behavioral analysis rather than source recovery
4. **For production**: Consider contacting professional reverse engineering services

## Resources

- Luraph Official Site: https://lura.ph/
- Lua Manual: https://www.lua.org/manual/5.3/
- Lua Debug Library: https://www.lua.org/manual/5.3/manual.html#6.10

## Conclusion

Luraph v14.6 represents state-of-the-art Lua obfuscation. Full automatic deobfuscation is extremely challenging and may not be possible without significant reverse engineering effort. The tools provided offer a starting point, but manual analysis is likely required for complete deobfuscation.

For most use cases, understanding the script's behavior through dynamic analysis is more practical than attempting full source code recovery.

---

*Last Updated: 2026-02-04*
*Tools Version: 1.0*
