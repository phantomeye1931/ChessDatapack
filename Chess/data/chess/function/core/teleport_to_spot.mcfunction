execute store result score $this chess.gameID run scoreboard players get @s chess.gameID

# Play a sound
execute at @n[type=interaction, tag=chess.moveHere, predicate=chess:game_id] run playsound minecraft:block.stone.hit block @a ~ ~ ~ 1 1.8

# Mark en passantable
tag @e[type=interaction, tag=chess.enPassantable, predicate=chess:game_id] add chess.enPassantTest
tag @e[type=interaction] remove chess.enPassantable

execute as @s[type=interaction, tag=chess.pawn] if entity @e[type=interaction, tag=chess.moveHere, predicate=chess:game_id, distance=1.9..2.1] run tag @s add chess.enPassantable

# Teleport the piece (selectedVehicle is used to preserve entity rotations)
execute on vehicle run tag @s add chess.selectedVehicle
execute at @n[type=interaction, tag=chess.moveHere, predicate=chess:game_id] run tp @n[type=item_display, tag=chess.selectedVehicle] ~ ~ ~

# Reset teleport duration
execute on vehicle run data merge entity @s {teleport_duration: 2}

# Remove temporary tags tags
tag @e[type=item_display] remove chess.selectedVehicle

# Castling
execute as @e[type=interaction, tag=chess.rook, tag=!chess.moved, tag=chess.white, predicate=chess:game_id] at @s facing entity @n[type=interaction, tag=chess.king, tag=chess.white, tag=!chess.moved, distance=..1.1, predicate=chess:game_id] feet on vehicle run tp @s ^ ^ ^2
execute as @e[type=interaction, tag=chess.rook, tag=!chess.moved, tag=chess.black, predicate=chess:game_id] at @s facing entity @n[type=interaction, tag=chess.king, tag=chess.black, tag=!chess.moved, distance=..1.1, predicate=chess:game_id] feet on vehicle run tp @s ^ ^ ^2

# Mark the piece as having moved
tag @s add chess.moved

# Switch turns
execute as @e[type=marker, tag=chess.boardData, predicate=chess:game_id] run function chess:core/switch_turns

# Start post-move actions
function chess:pieces/movement/post_move/post_move

# Destroy captured piece
execute as @n[type=interaction, tag=chess.moveHere, tag=chess.piece, predicate=chess:game_id] run function chess:core/destroy_piece

# Remove en passant'ed pawn
execute as @n[type=interaction, tag=chess.enPassantTest, predicate=chess:game_id] at @s positioned ^ ^ ^-1 if entity @n[type=interaction, tag=chess.pawn, distance=...5, predicate=chess:game_id] run function chess:core/destroy_piece

tag @e[type=interaction] remove chess.enPassantTest