# Reenable the trigger
scoreboard players set @s disable-music 0
scoreboard players enable @s disable-music

# Already disabled
execute if entity @s[tag=!chess.music.enabled] run return 1

# Stop the music
tag @s remove chess.music.enabled
stopsound @s record

tellraw @s "Disabled music!"