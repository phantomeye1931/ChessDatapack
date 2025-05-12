$execute align xyz positioned ~.5 ~ ~.5 run summon item_display ~ ~ ~ { view_range:4f, teleport_duration: 2, interpolation_duration: 2, transformation: { left_rotation:[0f, 0f, 0f, 1f], right_rotation:[0f, 0f, 0f, 1f], translation:[0f, .5f, 0f], scale:[0f, 0f, 0f] }, item: { id:"minecraft:stick", components: { "minecraft:item_model": "chess:pieces/$(TYPE)_$(COLOR)" } }, Tags:["chess.$(TYPE)", "chess.$(COLOR)"], Passengers: [ {id:"minecraft:interaction", width: 0.625f, height: $(HEIGHT)f, Tags:["chess.piece", "chess.this", "chess.$(TYPE)", "chess.$(COLOR)", "chess.gameNotStarted", "chess.action.spawning", "chess.boardThis"], Passengers:[{id:"minecraft:interaction", width:0f, height:-0.3125f, Passengers:[{id:"minecraft:shulker", Silent:1b, NoAI:1b, attributes:[{id:"minecraft:scale", base:0.25}], active_effects:[{id:"minecraft:invisibility", amplifier:1, duration:-1, show_particles:0b}], Invulnerable: 1b }] } ] } ] }

# Set the ID
execute store result score @n[tag=chess.this] chess.gameID run scoreboard players get @n[tag=chess.boardData] chess.gameID

# Spawn-in animation
scoreboard players set @n[type=interaction, tag=chess.this] chess.actionTimer 5

# Match rotation
execute rotated as @s as @e[type=!player, distance=..0.05] run rotate @s ~ 0

tag @n[type=interaction, tag=chess.this] remove chess.this

# Warning
execute if entity @s[tag=!chess.placement] run tellraw @a[distance=..5] {text:"WARNING: This is supposed to be run from a piece placement marker. Running it otherwise will cause unexpected results.", color:red}