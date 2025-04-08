# Animate pieces moving up/down TODO replace with translation
execute as @e[type=interaction,tag=chess.piece, tag=chess.selected] on vehicle at @s align xyz run tp @s ~.5 ~.2 ~.5
execute as @e[type=interaction,tag=chess.piece,tag=!chess.selected] on vehicle at @s align xyz run tp @s ~.5 ~ ~.5

execute as @e[type=interaction, nbt={interaction:{}}] at @s run function chess:core/click

function chess:core/timer

# Run music functionality
function chess:music/loop

scoreboard players set @a[scores={chess.left=1..}] chess.left 0