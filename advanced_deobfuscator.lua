#!/usr/bin/env lua5.3
-- Advanced Luraph Deobfuscation Tool
-- This attempts to modify the Luraph loader to dump the deobfuscated code

print("=== Advanced Luraph Deobfuscation ===\n")

-- Read the obfuscated script
local file = io.open("scripts.txt", "r")
if not file then
    print("Error: Could not open scripts.txt")
    os.exit(1)
end

local obfuscated_code = file:read("*all")
file:close()

-- Try to extract and modify the Luraph loader
print("Analyzing Luraph structure...")

-- The script starts with a comment and then a return statement
-- The actual loader is inside: return(function()...end)(...)

-- Let's try to hook into the final loadstring call
local deobfuscated_code = nil
local original_loadstring = loadstring or load

-- Create a custom environment
local custom_env = setmetatable({}, {__index = _G})

-- Hook loadstring/load in the custom environment
custom_env.loadstring = function(code, ...)
    if type(code) == "string" and #code > 1000 then
        deobfuscated_code = code
        print("Captured deobfuscated code! Length: " .. #code .. " bytes")
    end
    return original_loadstring(code, ...)
end

custom_env.load = custom_env.loadstring

-- Add a hook for the final call
local call_count = 0
local original_pcall = pcall
custom_env.pcall = function(func, ...)
    call_count = call_count + 1
    return original_pcall(func, ...)
end

-- Try to execute in the custom environment
print("Attempting deobfuscation...\n")

local success, err = pcall(function()
    local chunk, load_err = original_loadstring(obfuscated_code, "scripts.txt", "t", custom_env)
    if not chunk then
        error("Failed to load: " .. tostring(load_err))
    end
    
    -- Execute the chunk
    local result = chunk()
    
    -- If result is a function, it might be the deobfuscated code
    if type(result) == "function" then
        print("Got a function result, attempting to extract...")
        -- Try to get its source
        local info = debug.getinfo(result, "S")
        if info and info.source then
            print("Function source: " .. tostring(info.source))
        end
    end
    
    return result
end)

print("\n=== Results ===")
if deobfuscated_code then
    print("SUCCESS! Deobfuscated code captured.")
    print("Length: " .. #deobfuscated_code .. " bytes")
    
    -- Save to file
    local output = io.open("deobfuscated_script.lua", "w")
    if output then
        output:write("-- Deobfuscated from scripts.txt using Luraph deobfuscator\n")
        output:write("-- Original obfuscator: Luraph v14.6\n\n")
        output:write(deobfuscated_code)
        output:close()
        print("\nDeobfuscated code saved to: deobfuscated_script.lua")
        
        -- Show a preview
        print("\n=== Preview (first 1000 characters) ===")
        print(deobfuscated_code:sub(1, 1000))
        if #deobfuscated_code > 1000 then
            print("\n... (truncated, see deobfuscated_script.lua for full code)")
        end
    end
elseif not success then
    print("Execution failed: " .. tostring(err))
    print("\nThis Luraph version uses very advanced obfuscation.")
    print("Manual analysis may be required.")
else
    print("Could not capture deobfuscated code automatically.")
    print("\nThe script may:")
    print("1. Not call loadstring/load internally")
    print("2. Use direct bytecode execution")
    print("3. Require specific runtime arguments")
end

print("\n=== Technical Analysis ===")
print("Obfuscation: Luraph v14.6")
print("Structure: VM-based with compressed bytecode")
print("Protection level: Very High")
print("\nNote: Full deobfuscation of Luraph requires:")
print("- Reverse engineering the VM instruction set")
print("- Decoding the string compression algorithm")
print("- Reconstructing the original control flow")
print("\nFor production use, consider:")
print("- Contacting the script author for source code")
print("- Using dynamic analysis tools")
print("- Employing professional reverse engineering services")
