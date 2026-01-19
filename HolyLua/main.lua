math.randomseed(os.time())

dofile("core/world.lua")
dofile("core/entity.lua")
dofile("core/rules.lua")
dofile("scripture/genesis.lua")
dofile("scripture/miracles.lua")

World:add("Human")
World:add("Gods")
World:start()
