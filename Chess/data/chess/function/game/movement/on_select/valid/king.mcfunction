execute align y facing ~1 ~ ~1 positioned ~1 ~ ~1 run function chess:game/movement/on_select/validate_spot
execute align y facing ~1 ~ ~-1 positioned ~1 ~ ~-1 run function chess:game/movement/on_select/validate_spot
execute align y facing ~-1 ~ ~1 positioned ~-1 ~ ~1 run function chess:game/movement/on_select/validate_spot
execute align y facing ~-1 ~ ~-1 positioned ~-1 ~ ~-1 run function chess:game/movement/on_select/validate_spot

execute align y facing ~ ~ ~1 positioned ~ ~ ~1 run function chess:game/movement/on_select/validate_spot
execute align y facing ~1 ~ ~ positioned ~1 ~ ~ run function chess:game/movement/on_select/validate_spot
execute align y facing ~ ~ ~-1 positioned ~ ~ ~-1 run function chess:game/movement/on_select/validate_spot
execute align y facing ~-1 ~ ~ positioned ~-1 ~ ~ run function chess:game/movement/on_select/validate_spot

## Castling (ugh)
# Short castle
execute as @s[tag=!chess.moved, tag=!chess.checked] positioned ^3 ^ ^ if entity @n[type=interaction, tag=chess.rook, tag=!chess.moved, distance=...5] positioned ^-1 ^ ^ unless entity @n[type=interaction, tag=chess.piece, distance=...5] positioned ^-1 ^ ^ unless entity @n[type=interaction, tag=chess.piece, distance=...5] positioned ^1 ^ ^ run function chess:game/movement/on_select/validate_spot
execute as @s[tag=!chess.moved, tag=!chess.checked] positioned ^-3 ^ ^ if entity @n[type=interaction, tag=chess.rook, tag=!chess.moved, distance=...5] positioned ^1 ^ ^ unless entity @n[type=interaction, tag=chess.piece, distance=...5] positioned ^1 ^ ^ unless entity @n[type=interaction, tag=chess.piece, distance=...5] positioned ^-1 ^ ^ run function chess:game/movement/on_select/validate_spot

# Long castle
execute as @s[tag=!chess.moved, tag=!chess.checked] positioned ^4 ^ ^ if entity @n[type=interaction, tag=chess.rook, tag=!chess.moved, distance=...5] positioned ^-1 ^ ^ unless entity @n[type=interaction, tag=chess.piece, distance=...5] positioned ^-1 ^ ^ unless entity @n[type=interaction, tag=chess.piece, distance=...5] positioned ^-1 ^ ^ unless entity @n[type=interaction, tag=chess.piece, distance=...5] positioned ^2 ^ ^ run function chess:game/movement/on_select/validate_spot
execute as @s[tag=!chess.moved, tag=!chess.checked] positioned ^-4 ^ ^ if entity @n[type=interaction, tag=chess.rook, tag=!chess.moved, distance=...5] positioned ^1 ^ ^ unless entity @n[type=interaction, tag=chess.piece, distance=...5] positioned ^1 ^ ^ unless entity @n[type=interaction, tag=chess.piece, distance=...5] positioned ^1 ^ ^ unless entity @n[type=interaction, tag=chess.piece, distance=...5] positioned ^-2 ^ ^ run function chess:game/movement/on_select/validate_spot