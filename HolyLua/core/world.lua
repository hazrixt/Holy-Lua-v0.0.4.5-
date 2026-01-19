-- world.lua
World = {
    entities = {},
    rules = {},
    tick = 0,
    running = true
}

-- Adds entity
function World:add(name)
    local e = Entity:new(name)
    table.insert(self.entities, e)
    return e
end

-- Adds a rule
function World:rule(name, fn)
    self.rules[name] = fn
end

-- Applies all rules to an entity
function World:apply_rules(e)
    for _, r in pairs(self.rules) do
        r(e)
    end
end

-- Update all entities
function World:update()
    self.tick = self.tick + 1
    print("\n-- tick", self.tick, "--")

    for i = #self.entities, 1, -1 do
        local e = self.entities[i]
        e:update()           
        self:apply_rules(e)  

        -- Miracle verify
        Miracles:check(self, e)

        print(e.name, "energy:", e.energy, "| state:", e:get_state())
    end

    -- Rare miracle at tick 5
    if self.tick == 5 then
        Miracles:heal_all(5)
    end

    -- Easter eggs
    if self.tick == 1 then
        print("\n[?] The voice whispers: \"Don't be afraid to die, you're safe with me. I promise.\"")
    elseif self.tick == 2 then
        print("\n[?] The voice whispers: \"Have you ever felt truly that you know the meaning of this world and life itself?\"")
    elseif self.tick == 7 then
        print("\n[?] The voice whispers: \"It began with some simple curiosity and passion, didn't it, Icarus?\"")
    elseif self.tick == 14 then
        print("\n[?] The voice whispers: \"You've never failed to disappoint me dear, mother is always proud of you.\"")
    elseif self.tick == 42 then
        print("\n[?] The voice whispers: \"You're doing such a great job, you're making mother proud.\"")
    elseif self.tick == 108 then
        print("\n[?] The voice whispers: \"Don't stop here. The fun has just started.\"")
    end
end

-- World start
function World:start()
    while #self.entities > 0 do
        self:update()
        os.execute("timeout /t 1 > nul")  -- Windows
    end
    print("The world is empty.")
end
