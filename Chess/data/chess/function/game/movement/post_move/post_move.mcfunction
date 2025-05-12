# Set gameID for checking
execute store result score $this chess.gameID run scoreboard players get @s chess.gameID

# Reset pinned pieces
tag @e[type=interaction, tag=chess.piece, predicate=chess:game_id] remove chess.pinned

# Deselect all pieces and reset the valid spots
function chess:game/deselect_all

# Clean up previous markers
kill @e[type=marker, tag=chess.spotMarker]
tag @e[type=interaction] remove chess.checked

# For each piece, check gameID and place markers
tag @s add chess.initializer
execute as @e[type=interaction, tag=chess.piece, predicate=chess:game_id] at @s run function chess:game/movement/post_move/place_markers

# Find still valid moves
kill @e[type=marker, tag=chess.validMove, distance=..20]

execute as @e[type=marker, tag=chess.boardData, predicate=chess:game_id] run tag @s add chess.findValidMoves
execute as @e[type=interaction, tag=chess.piece, predicate=chess:game_id] at @s run function chess:game/movement/on_select/show_valid_spots
tag @e[type=marker, distance=..20] remove chess.findValidMoves

# Check whether the game is finished, in 2 ticks
execute as @e[type=marker, tag=chess.boardData, predicate=chess:game_id] at @s run function chess:game/movement/post_move/determine_game_state

# Remove temporary private tag
tag @s remove chess.initializer