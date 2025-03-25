tag @s add chess.marker

# Change turnWhite to turnBlack, and the other way around
execute as @s[tag=chess.turnWhite] run tag @s add chess.wasWhite

execute as @s[tag=chess.turnBlack] run tag @s add chess.turnWhite
execute as @s[tag=chess.turnBlack] run tag @s remove chess.turnBlack
execute as @s[tag=chess.wasWhite] run tag @s add chess.turnBlack
execute as @s[tag=chess.wasWhite] run tag @s remove chess.turnWhite

# Notify players of that team that it's now their turn
execute as @s[tag=chess.turnWhite] as @a[team=White] if score @s chess.gameID = @n[type=marker, tag=marker] chess.gameID run title @s actionbar {"text":"Your turn!"}
execute as @s[tag=chess.turnBlack] as @a[team=Black] if score @s chess.gameID = @n[type=marker, tag=marker] chess.gameID run title @s actionbar {"text":"Your turn!"}

# Remove temporary private tags
tag @s remove chess.wasWhite
tag @s remove chess.marker