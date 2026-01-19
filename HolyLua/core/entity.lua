Entity = {}
Entity.__index = Entity

-- Constructor
function Entity:new(name)
    return setmetatable({
        name = name,
        energy = 10
    }, self)
end

-- Updates entity's energy
function Entity:update()
    self.energy = self.energy - 1
end

-- Returnează starea entității în funcție de energie
function Entity:get_state()
    if self.energy <= 3 then
        return "weak"
    elseif self.energy >= 15 then
        return "empowered"
    else
        return "stable"
    end
end

-- entity.lua
Entity = {}
Entity.__index = Entity

function Entity:new(name)
    return setmetatable({
        name = name or "Unknown",
        energy = 10
    }, self)
end

function Entity:update()
    self.energy = self.energy - 1
end

function Entity:get_state()
    if self.energy <= 3 then
        return "weak"
    elseif self.energy >= 15 then
        return "empowered"
    else
        return "stable"
    end
end


-- Example usage
local e = Entity:new("Hero")
print(e:get_state())  -- "stable"
e:update()
print(e.energy)       -- 9
