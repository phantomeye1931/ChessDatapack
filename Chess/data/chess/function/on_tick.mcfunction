# Animate pieces moving up/down
execute as @e[type=interaction, tag=chess.piece, tag=chess.selected] on vehicle run data merge entity @s {start_interpolation: 0, transformation: {translation:[0f, .7f, 0f]}}

execute as @e[type=interaction, tag=chess.piece,  tag=chess.capturable] on vehicle run data merge entity @s {start_interpolation: 0, transformation: {left_rotation:[-0.07f, -0.07f, -0.07f, 1f], translation:[.1f, .7f, -.1f]}}
execute as @e[type=interaction, tag=chess.piece,  tag=chess.mated] on vehicle run data merge entity @s {start_interpolation: 0, transformation: {left_rotation:[-0.07f, -0.07f, -0.07f, 1f], translation:[.1f, .7f, -.1f]}}

execute as @e[type=interaction, tag=chess.piece, tag=!chess.capturable, tag=!chess.mated] on vehicle run data merge entity @s {start_interpolation: 0, transformation: {left_rotation:[0f, 0f, 0f, 1f]}}

execute as @e[type=interaction, tag=chess.piece, tag=!chess.selected, tag=!chess.capturable, tag=!chess.mated] on vehicle run data merge entity @s {transformation: {translation:[0f, .5f, 0f]}}


execute as @e[type=interaction, nbt={interaction:{}}] at @s run function chess:core/click

function chess:core/timer

# Run music functionality
function chess:music/loop

scoreboard players set @a[scores={chess.left=1..}] chess.left 0