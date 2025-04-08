$execute align xyz positioned ~.5 ~ ~.5 run summon item_display ~ ~ ~ { view_range:4f, teleport_duration: 2, interpolation_duration: 2, transformation: { left_rotation:[0f, 0f, 0f, 1f], right_rotation:[0f, 0f, 0f, 1f], translation:[0f, .5f, 0f], scale:[0f, 0f, 0f] }, item: { id:"minecraft:stick", components: { "minecraft:item_model": "chess:pieces/$(TYPE)_$(COLOR)" } }, Tags:["chess.$(TYPE)", "chess.$(COLOR)"], Passengers: [ {id:"minecraft:interaction", width: 0.625f, height: $(HEIGHT)f, Tags:["chess.piece", "chess.this", "chess.$(TYPE)", "chess.$(COLOR)", "chess.gameNotStarted", "chess.action.spawning", "chess.boardThis"], Passengers:[{id:"minecraft:interaction", width:0f, height:-0.3125f, Passengers:[{id:"minecraft:shulker", Silent:1b, NoAI:1b, attributes:[{id:"minecraft:scale", base:0.25}], active_effects:[{id:"minecraft:invisibility", amplifier:1, duration:-1, show_particles:0b}], Invulnerable: 1b }] } ] } ] }

$scoreboard players set @n[type=interaction, tag=chess.this] chess.gameID $(ID)
scoreboard players set @n[type=interaction, tag=chess.this] chess.actionTimer 5

execute at @n[type=interaction, tag=chess.this] rotated as @s if entity @n[type=interaction, tag=chess.white, distance=...5] as @e[type=!player, distance=..0.05] run rotate @s ~180 0
execute at @n[type=interaction, tag=chess.this] rotated as @s if entity @n[type=interaction, tag=chess.black, distance=...5] as @e[type=!player, distance=..0.05] run rotate @s ~ 0

tag @n[type=interaction, tag=chess.this] remove chess.this