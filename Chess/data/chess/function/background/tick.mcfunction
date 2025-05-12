# Update the day time scoreboard
execute store result score $current chess.dayTime run time query daytime

# Turn on window lights at night
function chess:background/windows

# Slow down day-time
function chess:background/time

# Check at all players for barriers
execute as @a[gamemode=adventure] at @s run function chess:background/barrier

execute as @e[type=armor_stand, tag=chess.traffic.car] at @s run function chess:background/traffic/car