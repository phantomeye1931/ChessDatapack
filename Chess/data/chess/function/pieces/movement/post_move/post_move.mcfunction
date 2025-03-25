# Deselect all pieces and reset the valid spots
function chess:pieces/deselect_all

# Clean up previous markers
kill @e[type=marker, tag=chess.spotMarker]
tag @e[type=interaction] remove chess.checked

# For each piece, check gameID and place markers
tag @s add chess.initializer
execute as @e[type=interaction, tag=chess.piece] if score @s chess.gameID = @n[type=interaction, tag=chess.initializer] chess.gameID at @s run function chess:pieces/movement/post_move/place_markers

# Check whether the game is finished
function chess:pieces/movement/post_move/determine_game_state

# Remove temporary private tag
tag @s remove chess.initializer