# Reenable the trigger
scoreboard players set @s enable-music 0
scoreboard players enable @s enable-music

# Already enabled
execute if entity @s[tag=chess.music.enabled] run return 1

# Start the music
tag @s add chess.music.enabled
scoreboard players set @s chess.musicTimer 60

tellraw @s "Enabled music!"