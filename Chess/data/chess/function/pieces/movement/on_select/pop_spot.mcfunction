# Early return if off board
execute unless block ~ ~-1 ~ #board run return 1

# There is a piece here
tag @n[type=interaction, distance=...5, tag=chess.piece] add chess.capturable

# There is no piece here
execute unless entity @n[type=interaction, distance=...5, tag=chess.piece] align xyz positioned ~.5 ~ ~.5 run summon item_display ~ ~ ~ { transformation: { left_rotation:[0f,0f,0f,1f], right_rotation:[0f,0f,0f,1f], translation:[0f,.5f,0f], scale:[1f,1f,1f] }, item: { id:"minecraft:stick", components: { "minecraft:item_model": "chess:pieces/valid_spot" } }, Tags:["chess.validSpot"], Passengers: [ {id:"minecraft:interaction", width: 0.625f, height: 0.1875f, Tags:["chess.validSpot"] } ] }

# Pass down tags and game ID
execute if entity @s[tag=chess.white] run tag @n[tag=validSpot, type=interaction, distance=...5] add chess.white
execute if entity @s[tag=chess.black] run tag @n[tag=validSpot, type=interaction, distance=...5] add chess.black
execute store result score @n[type=interaction, tag=chess.validSpot, distance=...5] chess.gameID run scoreboard players get @s chess.gameID