
local inputs = {
  { "LeftY", SOURCE },
  { "RghtY", SOURCE },
  { "Activ", SOURCE },
  {"Dance", SOURCE}
}

local outputs = { "SPNL", "SPNR" }

local function init()
end

-- timer variables
TIMER_DANCE = 0


-- joystick zero
LEFT_ZERO = 5.1
RIGHT_ZERO = 0.1

local function run(left_stick, right_stick, activator, dance)

    -- fix zero input
    left_stick = left_stick - LEFT_ZERO
    right_stick = right_stick - RIGHT_ZERO

    if activator > 900 then
        return 1024, -1024

    elseif dance > 900 then
        TIMER_DANCE = TIMER_DANCE + 1
        local step = TIMER_DANCE % 120
        
        if step < 30 then
            return 500, -500
            
        elseif step < 60 then
            if (step % 10) < 5 then
                return 600, 600
            else
                return -600, -600
            end
            
        elseif step < 90 then
            return -500, 500
        else
            if (step % 10) < 5 then
                return 600, -600
            else
                return -600, 600 
            end
        end

    else
        TIMER_DANCE = 0
        return left_stick, right_stick
    end
end

return { input=inputs, output=outputs, run=run, init=init }