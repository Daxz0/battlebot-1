
local inputs = {
  { "LeftY", SOURCE },
  { "RghtY", SOURCE },
  { "Activ", SOURCE }
}

local outputs = { "SPNL", "SPNR" }

local function init()
end

local function run(left_stick, right_stick, activator)
    if activator > 900 then
        return 1024, -1024
    else
        return left_stick, right_stick
    end
end

return { input=inputs, output=outputs, run=run, init=init }