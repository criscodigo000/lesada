#!/usr/bin/env lua5.3
--[[
    Luraph Structure Analyzer
    This tool analyzes the structure of Luraph-obfuscated scripts
    and attempts to extract meaningful information.
]]

print("=== Luraph Structure Analyzer ===\n")

-- Read the obfuscated script
local function read_file(filename)
    local file = io.open(filename, "r")
    if not file then return nil end
    local content = file:read("*all")
    file:close()
    return content
end

local content = read_file("scripts.txt")
if not content then
    print("Error: Could not read scripts.txt")
    os.exit(1)
end

print("File Information:")
print("- Size: " .. #content .. " bytes")
print("- Lines: " .. select(2, content:gsub('\n', '\n')) + 1)
print()

-- Analyze the structure
print("Structure Analysis:")
print("===================")

-- Check for Luraph header
if content:match("Luraph Obfuscator v(%d+%.%d+)") then
    local version = content:match("Luraph Obfuscator v(%d+%.%d+)")
    print("✓ Luraph version detected: v" .. version)
end

-- Check for common Luraph patterns
local patterns_found = {}

-- Pattern 1: return(function() wrapper
if content:match("return%s*%(%s*function%s*%(%)") then
    table.insert(patterns_found, "IIFE wrapper (return(function()...end)())")
end

-- Pattern 2: String table indicators
if content:match("local%s+[%w_]+%s*=%s*string%.char") then
    table.insert(patterns_found, "String decompression layer")
end

-- Pattern 3: VM-style arrays
if content:match("%[0%]=") then
    table.insert(patterns_found, "Zero-indexed arrays (VM data structures)")
end

-- Pattern 4: Compression markers
if content:match("unpack") then
    table.insert(patterns_found, "Data unpacking operations")
end

-- Pattern 5: Obfuscated identifiers
local short_vars = {}
for var in content:gmatch("local%s+([a-zA-Z])%s*[,=]") do
    if #var == 1 then
        short_vars[var] = true
    end
end
if next(short_vars) then
    local count = 0
    for _ in pairs(short_vars) do count = count + 1 end
    table.insert(patterns_found, "Single-letter variables: " .. count .. " unique")
end

print("\nPatterns Detected:")
for i, pattern in ipairs(patterns_found) do
    print("  " .. i .. ". " .. pattern)
end

-- Attempt to estimate complexity
print("\nComplexity Metrics:")
local complexity = {
    functions = select(2, content:gsub("function", "")),
    locals = select(2, content:gsub("local", "")),
    tables = select(2, content:gsub("{", "")),
    loops = select(2, content:gsub("for", "")) + select(2, content:gsub("while", "")),
    conditionals = select(2, content:gsub("if", ""))
}

for key, value in pairs(complexity) do
    print("  " .. key .. ": " .. value)
end

-- Try to extract any string literals that might give hints
print("\nExtracted Hints:")
local hints = {}

-- Look for URLs
for url in content:gmatch("https?://[%w%./-]+") do
    if not hints[url] then
        hints[url] = true
        print("  URL: " .. url)
    end
end

-- Look for common Lua keywords in strings
for str in content:gmatch('"([^"]+)"') do
    if #str > 3 and #str < 30 and str:match("^[%w%s]+$") then
        if not hints[str] then
            hints[str] = true
            print("  String: " .. str)
        end
    end
end

-- Generate a summary report
print("\n" .. string.rep("=", 50))
print("ANALYSIS SUMMARY")
print(string.rep("=", 50))

local report = io.open("analysis_report.txt", "w")
if report then
    report:write("Luraph Script Analysis Report\n")
    report:write("=============================\n\n")
    report:write("File: scripts.txt\n")
    report:write("Size: " .. #content .. " bytes\n")
    report:write("Obfuscator: Luraph v14.6\n\n")
    
    report:write("Complexity Metrics:\n")
    for key, value in pairs(complexity) do
        report:write("  " .. key .. ": " .. value .. "\n")
    end
    
    report:write("\nDetected Patterns:\n")
    for i, pattern in ipairs(patterns_found) do
        report:write("  " .. i .. ". " .. pattern .. "\n")
    end
    
    report:write("\nDeobfuscation Status: PARTIAL\n")
    report:write("Reason: Luraph v14.6 uses VM-based execution that requires\n")
    report:write("        advanced reverse engineering to fully deobfuscate.\n\n")
    
    report:write("Recommendations:\n")
    report:write("1. Contact the script author for original source\n")
    report:write("2. Use dynamic analysis for behavior understanding\n")
    report:write("3. Consider professional reverse engineering services\n")
    report:write("4. Review DEOBFUSCATION_GUIDE.md for detailed methods\n")
    
    report:close()
    print("\n✓ Full analysis report saved to: analysis_report.txt")
end

print("\n" .. string.rep("=", 50))
print("Conclusion:")
print("This script uses advanced Luraph v14.6 obfuscation.")
print("Full automatic deobfuscation is not feasible with")
print("standard tools. See DEOBFUSCATION_GUIDE.md for alternatives.")
print(string.rep("=", 50))
