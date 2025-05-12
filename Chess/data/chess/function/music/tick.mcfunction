# Play the fade-in music at timer 100, real music at 2463
execute as @a[scores={chess.musicTimer=100}, tag=chess.music.enabled] at @s run playsound chess:music_loop_fade record @s ~ ~ ~ 999 1 0
execute as @a[scores={chess.musicTimer=2461}, tag=chess.music.enabled] at @s run playsound chess:music_loop record @s ~ ~ ~ 999 1 0

# Count until music has to be looped, start at 100, modulo 2463
scoreboard players add @a[tag=chess.music.enabled] chess.musicTimer 1
scoreboard players set @a[scores={chess.musicTimer=4827..}] chess.musicTimer 2461

# Reset the timer for any players that just rejoined, so that the music plays from the start
execute as @a[scores={chess.left=1..}] run scoreboard players set @s chess.musicTimer 0

function chess:music/triggers