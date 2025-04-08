# Set game ID for compare
execute store result score $this chess.gameID run scoreboard players get @s chess.gameID

# Early return if off board, or pinned piece isn't allowed to move that way
execute unless block ~ ~-1 ~ #board run return 1
execute unless function chess:pieces/movement/on_select/pinned_allowed run return 1

# Saving valid move
execute as @s[tag=chess.white] if entity @n[type=marker, tag=chess.boardData, tag=chess.findValidMoves, predicate=chess:game_id] run summon marker ~ ~ ~ { Tags:["chess.validMove", "chess.white"] }
execute as @s[tag=chess.black] if entity @n[type=marker, tag=chess.boardData, tag=chess.findValidMoves, predicate=chess:game_id] run summon marker ~ ~ ~ { Tags:["chess.validMove", "chess.black"] }
execute store result score @e[type=marker, tag=chess.validMove, distance=...5] chess.gameID run scoreboard players get @s chess.gameID
execute if entity @n[type=marker, tag=chess.boardData, tag=chess.findValidMoves, predicate=chess:game_id] run return 1

# There is a piece here
tag @n[type=interaction, distance=...5, tag=chess.piece] add chess.capturable

# There is no piece here; summon a ring
execute unless entity @n[type=interaction, distance=...5, tag=chess.piece] align xyz positioned ~.5 ~ ~.5 run summon item_display ~ ~ ~ { start_interpolation: 0, interpolation_duration: 2, transformation: { left_rotation:[0f,0f,0f,1f], right_rotation:[0f,0f,0f,1f], translation:[0f,.5f,0f], scale:[1f,1f,1f] }, item: { id:"minecraft:stick", components: { "minecraft:item_model": "chess:pieces/valid_spot" } }, Tags:["chess.validSpot"], Passengers: [ {id:"minecraft:interaction", width: 0.625f, height: 0.1875f, Tags:["chess.validSpot"] } ] }

# Pass down tags and game ID
execute as @s[tag=chess.white] run tag @n[type=interaction, tag=validSpot, distance=...5] add chess.white
execute as @s[tag=chess.black] run tag @n[type=interaction, tag=validSpot, distance=...5] add chess.black

execute store result score @e[type=marker, tag=chess.validMove, distance=...5] chess.gameID run scoreboard players get @s chess.gameID
execute store result score @e[type=interaction, tag=chess.validSpot, distance=...5] chess.gameID run scoreboard players get @s chess.gameID

scoreboard players set @n[type=interaction, tag=chess.validSpot, distance=...5] chess.actionTimer 3