# Set the game ID for compare
$scoreboard players set $this chess.gameID $(ID)

# Destroy all pieces
execute as @e[tag=chess.piece, predicate=chess:game_id] run function chess:core/destroy_piece
# kill @e[type=marker, tag=chess.boardData, predicate=chess:game_id]
kill @e[type=marker, tag=chess.spotMarker, predicate=chess:game_id]
kill @e[type=marker, tag=chess.validMove, predicate=chess:game_id]

execute as @e[type=interaction, tag=chess.validSpot, predicate=chess:game_id] on vehicle run kill @s
execute as @e[type=interaction, tag=chess.validSpot, predicate=chess:game_id] run kill @s