# Only allow this function if this is the board data marker
execute as @s[tag=!chess.boardData] run return 1

# Set game ID for compare
execute store result score $this chess.gameID run scoreboard players get @s chess.gameID

tag @s remove chess.findValidMoves

# Destroy all pieces
execute as @e[type=interaction, tag=chess.piece, predicate=chess:game_id] run function chess:core/destroy_piece

# Remove markers
kill @e[type=marker, tag=chess.spotMarker, predicate=chess:game_id]
kill @e[type=marker, tag=chess.validMove, predicate=chess:game_id]

# Remove spots
execute as @e[type=interaction, tag=chess.validSpot, predicate=chess:game_id] on vehicle run kill @s
execute as @e[type=interaction, tag=chess.validSpot, predicate=chess:game_id] run kill @s

# Remove texts
kill @e[type=text_display, tag=chess.mateText, predicate=chess:game_id]
kill @e[type=text_display, tag=chess.stalemateText, predicate=chess:game_id]
kill @e[type=text_display, tag=chess.joinText, predicate=chess:game_id]

team leave @a[team=White, predicate=chess:game_id]
team leave @a[team=Black, predicate=chess:game_id]

# Queue new pieces spawning
scoreboard players set @s chess.actionTimer 20
tag @s add chess.action.resetting

execute if entity @s[tag=chess.turnBlack] run function chess:core/switch_turns