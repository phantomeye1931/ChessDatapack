# Handle clicks
execute as @e[type=interaction, nbt={interaction:{}}] at @s run function chess:core/click

# Keep track of the timers
function chess:core/timer
function chess:background/timer

# Run tick functions of other 'modules'
function chess:music/tick
function chess:background/tick
function chess:ambience/tick

execute as @a[scores={clicked=1..}] at @s run function chess:debug/automatic/clicked

scoreboard players set @a[scores={chess.left=1..}] chess.left 0