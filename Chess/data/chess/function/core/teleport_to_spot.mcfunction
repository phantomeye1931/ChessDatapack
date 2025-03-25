# Play a sound
execute at @n[type=interaction, tag=chess.moveHere] run playsound minecraft:block.stone.hit block @a ~ ~ ~ 1 1.8

# Teleport the piece (selectedVehicle is used to preserve entity rotations)
execute at @n[type=interaction, tag=chess.selected] run setblock ~ ~ ~ air
execute as @n[type=interaction, tag=chess.selected] on vehicle run tag @s add chess.selectedVehicle
execute at @n[type=interaction, tag=chess.moveHere] run tp @n[type=item_display, tag=chess.selectedVehicle] ~ ~ ~

# Reset teleport duration
execute as @n[type=interaction, tag=chess.selected] on vehicle run data merge entity @s {teleport_duration: 2}

# Ensure entities are removed
execute as @n[type=interaction, tag=chess.moveHere, tag=chess.piece] run function chess:core/destroy_piece

# Remove temporary tags tags
tag @e remove chess.selectedVehicle

# Mark the piece as having moved
tag @n[type=interaction, tag=chess.selected] add chess.moved

# Switch turns
execute as @e[type=marker, tag=chess.boardData] if score @s chess.gameID = @n[type=interaction, tag=chess.moveHere] chess.gameID run function chess:core/switch_turns

# Start post-move actions
execute as @e[type=interaction, tag=chess.piece] if score @s chess.gameID = @n[type=interaction, tag=chess.moveHere] chess.gameID run function chess:pieces/movement/post_move/post_move