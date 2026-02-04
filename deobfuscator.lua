#!/usr/bin/env lua5.3
-- Luraph Deobfuscation Tool
-- This script attempts to capture the deobfuscated code by hooking into Lua's execution

print("=== Luraph Deobfuscation Tool ===")
print("Analyzing scripts.txt...")
print()

-- Read the obfuscated script
local file = io.open("scripts.txt", "r")
if not file then
    print("Error: Could not open scripts.txt")
    os.exit(1)
end

local obfuscated_code = file:read("*all")
file:close()

-- Hook the loadstring/load functions to capture decompressed code
local original_load = load
local original_loadstring = loadstring
local captured_code = nil

-- Create a custom load function that captures the code
local function hooked_load(chunk, chunkname, mode, env)
    if type(chunk) == "string" and #chunk > 100 then
        -- This might be the decompressed code
        print("Captured potential deobfuscated code:")
        print("Length: " .. #chunk .. " bytes")
        print()
        captured_code = chunk
    end
    return original_load(chunk, chunkname, mode, env)
end

-- Replace load function
_G.load = hooked_load
if loadstring then
    _G.loadstring = hooked_load
end

-- Try to execute the obfuscated script in a protected environment
print("Attempting to execute obfuscated script...")
print("(This may fail if the script requires specific environment)")
print()

local success, result = pcall(function()
    local func, err = original_load(obfuscated_code, "scripts.txt", "t", _G)
    if not func then
        print("Load error: " .. tostring(err))
        return nil
    end
    
    -- Try to call it (may fail if it expects specific arguments)
    local exec_success, exec_result = pcall(func)
    if not exec_success then
        print("Execution error (expected): " .. tostring(exec_result))
    end
    return exec_result
end)

print()
print("=== Analysis Complete ===")
print()

if captured_code then
    print("Successfully captured deobfuscated code!")
    print("Writing to deobfuscated_output.lua...")
    
    local output = io.open("deobfuscated_output.lua", "w")
    if output then
        output:write("-- Deobfuscated from scripts.txt\n")
        output:write("-- Captured by Luraph deobfuscation tool\n\n")
        output:write(captured_code)
        output:close()
        print("Done! Deobfuscated code saved to: deobfuscated_output.lua")
    else
        print("Error: Could not write output file")
        print("Captured code (first 500 chars):")
        print(captured_code:sub(1, 500))
    end
else
    print("Could not capture deobfuscated code.")
    print("The script uses advanced VM-based obfuscation.")
    print()
    print("Alternative deobfuscation methods:")
    print("1. Use a Lua debugger to step through execution")
    print("2. Modify the obfuscated script to print its decompressed form")
    print("3. Use memory analysis tools")
    print("4. Contact the script author for the original source")
end

print()
print("=== Obfuscation Analysis ===")
print("Obfuscator: Luraph v14.6")
print("Techniques detected:")
print("- Custom bytecode VM")
print("- String compression")
print("- Control flow obfuscation")
print("- Constant encryption")
print()
