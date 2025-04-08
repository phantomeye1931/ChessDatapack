# 1 away
execute align y positioned ^ ^ ^1 unless entity @n[tag=chess.piece, distance=...2] if block ~ ~-.5 ~ #board run function chess:pieces/movement/on_select/validate_spot
# 2 away
execute if entity @s[tag=!chess.moved] align y positioned ^ ^ ^1 unless entity @n[tag=chess.piece, distance=...2] positioned ^ ^ ^1 unless entity @n[tag=chess.piece, distance=...2] if block ~ ~-.5 ~ #board run function chess:pieces/movement/on_select/validate_spot

# Diagonal captures
execute as @s[tag=chess.white] positioned ^1 ^ ^1 if entity @n[type=interaction, tag=!chess.white, tag=chess.piece, distance=...5] run function chess:pieces/movement/on_select/validate_spot
execute as @s[tag=chess.black] positioned ^1 ^ ^1 if entity @n[type=interaction, tag=!chess.black, tag=chess.piece, distance=...5] run function chess:pieces/movement/on_select/validate_spot
execute as @s[tag=chess.white] positioned ^-1 ^ ^1 if entity @n[type=interaction, tag=!chess.white, tag=chess.piece, distance=...5] run function chess:pieces/movement/on_select/validate_spot
execute as @s[tag=chess.black] positioned ^-1 ^ ^1 if entity @n[type=interaction, tag=!chess.black, tag=chess.piece, distance=...5] run function chess:pieces/movement/on_select/validate_spot

# En passant 
execute positioned ^1 ^ ^ if entity @n[type=interaction, tag=chess.enPassantable, tag=chess.piece, distance=...5] positioned ^ ^ ^1 run function chess:pieces/movement/on_select/validate_spot
execute positioned ^-1 ^ ^ if entity @n[type=interaction, tag=chess.enPassantable, tag=chess.piece, distance=...5] positioned ^ ^ ^1 run function chess:pieces/movement/on_select/validate_spot