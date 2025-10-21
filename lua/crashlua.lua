-- 1. Comments

-- this is a comment
--[[
    this is multilineal comment
--]]

-- 2. Variables: Simple Literals

local number = 3

local string = "this is a string"
local single = 'this is other string'
local crazy = [[
    this is other (multilineal) string
]]

local truth, lies = true, false

local nothing = nil

-- 3. Variables: Functions

local function hello(name)
    print("Hello!",name)
end

local greet = function (name)
    print("Greetings, " .. name .. "!")
end

local higher_order = function(value)
    return function(another)
        return value + another
    end
end

local add_one = higher_order(10)
print( add_one(2) )

-- 4. Variables: Tables

local list = {"first", 2, true, function() return "hello, Im fourth" end }
print( list[1] )   --> "first"
print( list[4]() ) --> "hello, Im fourth" 

local t = {
    Literal_key = "a string",
    ["an expression"] = "also work",
    [function() end] = true
}
print(t.Literal_key)
print(t["an expression"])
print(t[function() end])

-- 5. Control flow: for

local favorite_accounts = { "The Primeagen", "Lex Friedman", "Granderson"}

for index=1, #favorite_accounts do
    print(index, favorite_accounts[index])
end 

for index, value in ipairs(favorite_accounts) do
    print(index, value) 
end

local reading_scores = {thePrimeagen = 10, granderson=20}

for index=1, #reading_scores do
    print(index, reading_scores[index])
end

for index, value in pairs(reading_scores) do
    print(index, value)
end

-- 6. Control flow: if

local function action (loves_coffee)
    if loves_coffee then
        print("I love coffee")
    else 
        print(":(")
    end
end

action()
action(false)
action(true)
action(1)
action(0)

-- 7. Modules

--[[

local M = {}
M.cool_functions = function() print("hello from a module") end
return M

local foo = require('foo')
foo.cool_functions() --> "hello from a module"

--]]

-- 8. Multiple returns

local return_four_values = function ()
    return 1,2,3,4 
end

a,b,c,d = return_four_values()
print(a)
print(b)
print(d)

local variable_arguments = function (...)
    local arguments = { ... } 
    for i, v in ipairs( { ... } ) do print(i,v) end
    return table.unpack(arguments)
end

variable_arguments("hello", "world", "!")

-- 9. Functiosn: Callilng

local simple_string = function(s)
    return s .. " - WOW!"
end

local x = simple_string("hi")
local y = simple_string "hi"
print(x, y)

local setup = function(opts)
    if opts.default == nil then
        opts.default = 17
    end
    print(opts.default, opts.other)
end

setup {default = 12, other = false}
setup {other = true}

-- 10. Function: Colon Functions

local mytable = {}
function mytable.something(self, ...) end 
function mytable:something(...) end 

-- 11. Metatables

local vector_mt = {}
vector_mt.__add = function(right, left)
    return setmetatable({
        left[1] + right[1],
        left[2] + right[2],
        left[3] + right[3]
    }, vector_mt)
end

local v1 = setmetatable({3,1,2}, vector_mt)
local v2 = setmetatable({-3, 2, 2}, vector_mt)
local v3 = v1 + v2

print(v3[1], v3[2], v3[3])
print(v3 + v3)


local fib_mt = {
    __index = function (self, key)
        if key < 2 then return -1 end
        self[key] = self[key - 2] + self[key - 1]
        return self[key] 
    end 
}

local fib = setmetatable({}, fib_mt)
print(fib[5])
print(fib[100])

