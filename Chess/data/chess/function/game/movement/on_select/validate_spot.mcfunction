# Early return if off board, or if there's a piece of the same team
execute unless block ~ ~-1 ~ #board run return 1
execute as @s[tag=chess.white] if entity @n[type=interaction, distance=...5, tag=chess.piece, tag=chess.white] run return 1
execute as @s[tag=chess.black] if entity @n[type=interaction, distance=...5, tag=chess.piece, tag=chess.black] run return 1

# Mark whether check exists
execute as @s[tag=chess.black] if entity @n[type=interaction, tag=chess.black, tag=chess.checked] run tag @s add chess.existsCheck
execute as @s[tag=chess.white] if entity @n[type=interaction, tag=chess.white, tag=chess.checked] run tag @s add chess.existsCheck

# Mark whether this spot is defended by an opposing piece
execute as @s[tag=chess.white] if entity @n[type=marker, tag=!chess.white, tag=chess.vulnerable, distance=...5] run tag @s add chess.spotIsVulnerable
execute as @s[tag=chess.black] if entity @n[type=marker, tag=!chess.black, tag=chess.vulnerable, distance=...5] run tag @s add chess.spotIsVulnerable

## No check
execute as @s[tag=!chess.existsCheck, tag=!chess.king] run function chess:game/movement/on_select/mark_valid
execute as @s[tag=!chess.existsCheck, tag=chess.king, tag=!chess.spotIsVulnerable] run function chess:game/movement/on_select/mark_valid

execute as @s[tag=!chess.existsCheck] run tag @s remove chess.spotIsVulnerable
execute as @s[tag=!chess.existsCheck] run return 1

## Yes check
# King; Spot is not defended by an opposing piece
execute as @s[tag=chess.king, tag=!chess.spotIsVulnerable] run function chess:game/movement/on_select/mark_valid

# Not king; Piece is origin of check
execute as @s[tag=!chess.king] if entity @n[type=interaction, tag=chess.checkOrigin, distance=...5] run function chess:game/movement/on_select/mark_valid

# Not king; Spot is on the path to check
execute as @s[tag=!chess.king, tag=chess.white] if entity @n[type=marker, tag=!chess.white, tag=chess.checkPath, distance=...5] run function chess:game/movement/on_select/mark_valid
execute as @s[tag=!chess.king, tag=chess.black] if entity @n[type=marker, tag=!chess.black, tag=chess.checkPath, distance=...5] run function chess:game/movement/on_select/mark_valid

# Remove temporary private tags
tag @s remove chess.spotIsVulnerable