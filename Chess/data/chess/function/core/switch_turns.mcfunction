execute store result score $this chess.gameID run scoreboard players get @s chess.gameID

# Change turnWhite to turnBlack, and the other way around
execute as @s[tag=chess.turnWhite] run tag @s add chess.wasWhite

execute as @s[tag=chess.turnBlack] run tag @s add chess.turnWhite
execute as @s[tag=chess.turnBlack] run tag @s remove chess.turnBlack
execute as @s[tag=chess.wasWhite] run tag @s add chess.turnBlack
execute as @s[tag=chess.wasWhite] run tag @s remove chess.turnWhite

# Notify players of that team that it's now their turn
execute as @s[tag=chess.turnWhite] as @a[team=White, predicate=chess:game_id] run title @s actionbar {"text":"Your turn!"}
execute as @s[tag=chess.turnBlack] as @a[team=Black, predicate=chess:game_id] run title @s actionbar {"text":"Your turn!"}

execute as @s[tag=chess.turnWhite] at @s as @a[team=White, predicate=chess:game_id, distance=20..] at @s run playsound block.note_block.bell master @s
execute as @s[tag=chess.turnBlack] at @s as @a[team=Black, predicate=chess:game_id, distance=20..] at @s run playsound block.note_block.bell master @s

# Remove temporary private tags
tag @s remove chess.wasWhite