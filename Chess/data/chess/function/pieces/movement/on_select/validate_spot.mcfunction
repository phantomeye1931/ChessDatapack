# Early return if off board, or if there's a piece of the same team
execute unless block ~ ~-1 ~ #board run return 1
execute as @s[tag=chess.white] if entity @n[type=interaction, distance=...5, tag=chess.piece, tag=chess.white] run return 1
execute as @s[tag=chess.black] if entity @n[type=interaction, distance=...5, tag=chess.piece, tag=chess.black] run return 1

# Mark whether check exists
execute as @s[tag=chess.black] if entity @n[type=interaction, tag=!chess.black, tag=chess.checked] run tag @s add chess.existsCheck
execute as @s[tag=chess.white] if entity @n[type=interaction, tag=!chess.white, tag=chess.checked] run tag @s add chess.existsCheck

## No check
execute as @s[tag=!chess.existsCheck] run function chess:pieces/movement/on_select/pop_spot
execute as @s[tag=!chess.existsCheck] run return 1

## Yes check
# Mark whether the king is selected
execute if entity @n[type=interaction, tag=chess.selected, tag=chess.king] run tag @s add chess.kingSelected

# Mark whether this spot is defended by an opposing piece
execute as @s[tag=chess.white] if entity @n[type=marker, tag=!chess.white, tag=chess.vulnerable, distance=...5] run tag @s add chess.spotIsVulnerable
execute as @s[tag=chess.black] if entity @n[type=marker, tag=!chess.black, tag=chess.vulnerable, distance=...5] run tag @s add chess.spotIsVulnerable

# King; Spot is not defended by an opposing piece
execute as @s[tag=chess.kingSelected, tag=!chess.spotIsVulnerable] run function chess:pieces/movement/on_select/pop_spot

# Not king; Piece is origin of check
execute as @s[tag=!chess.kingSelected] run tag @n[type=interaction, tag=chess.checkOrigin, distance=...5] add chess.capturable

# Not king; Spot is on the path to check
execute as @s[tag=!chess.kingSelected, tag=chess.white] run tag @n[type=marker, tag=!chess.white, tag=chess.checkPath, distance=...5] add chess.capturable
execute as @s[tag=!chess.kingSelected, tag=chess.black] run tag @n[type=marker, tag=!chess.black, tag=chess.checkPath, distance=...5] add chess.capturable

# Remove temporary private tags
tag @s remove chess.kingSelected
tag @s remove chess.spotIsVulnerable