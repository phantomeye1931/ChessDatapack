# Turn lights on in the evening
execute if score $current chess.dayTime matches 12500..15000 as @e[type=marker, tag=chess.window, sort=random, limit=1] at @s run fill ^ ^ ^ ^-1 ^2 ^ light replace air

# Turn lights off in the morning
execute if score $current chess.dayTime matches 22500..24000 as @e[type=marker, tag=chess.window, sort=random, limit=1] at @s run fill ^ ^ ^ ^-1 ^2 ^ air replace light

# Ensure no lights stay on during the day
execute if score $current chess.dayTime matches 0 as @e[type=marker, tag=chess.window] at @s run fill ^ ^ ^ ^-1 ^2 ^ air replace light