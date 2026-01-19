-- miracles.lua
Miracles = {}

-- Heal all entities
function Miracles:heal_all(amount)
    amount = amount or 1
    print("\n[!] A miracle occurs: healing all beings by " .. amount)
    for _, e in ipairs(World.entities) do
        e.energy = e.energy + amount
    end
end

-- Resurrect a new entity
function Miracles:resurrect(name)
    name = name or "Unknown"
    print("\n[!] A miracle occurs: resurrection of " .. name)
    World:add(name)
end

-- Random miracle for a specific entity
function Miracles:check(world, entity)
    if not entity then return end  -- protecție împotriva nil
    local roll = math.random(1, 100)
    local state = entity:get_state()

    if roll == 1 and state == "weak" then
        print("\n[!] A mercy miracle occurs for " .. entity.name)
        entity.energy = entity.energy + 6

    elseif roll == 2 and state == "empowered" then
        print("\n[!] Power draws attention on " .. entity.name)
        entity.energy = entity.energy + 2

    elseif roll == 3 then
        print("\n[!] The world hesitates for " .. entity.name)
        entity.energy = entity.energy + 1
    end
end
