# Set gameID for checking
execute store result score $this chess.gameID run scoreboard players get @s chess.gameID

# For all pieces, compare game ID and deselect if it's the same
tag @e[type=interaction, tag=chess.piece, predicate=chess:game_id] remove chess.selected
tag @e[type=interaction, tag=chess.piece, predicate=chess:game_id] remove chess.capturable

# Kill all spots
execute as @e[type=interaction, tag=chess.validSpot, predicate=chess:game_id] on vehicle run kill @s
execute as @e[type=interaction, tag=chess.validSpot, predicate=chess:game_id] run kill @s

# Remove global per-round tags
tag @e[type=interaction, predicate=chess:game_id] remove chess.existsCheck