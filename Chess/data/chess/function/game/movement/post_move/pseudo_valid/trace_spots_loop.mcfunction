execute unless block ~ ~-.5 ~ #board run return 1

# Mark this position
execute as @s[tag=!chess.hit] run function chess:game/movement/post_move/mark_vulnerable

# Mark the ray as having hit a piece if there's a piece; Trace through different-colored kings
execute as @s[tag=chess.white] if entity @n[type=interaction, tag=chess.piece, distance=...5] unless entity @n[type=interaction, tag=chess.piece, distance=...5, tag=chess.king, tag=!chess.white] run tag @s add chess.hit
execute as @s[tag=chess.black] if entity @n[type=interaction, tag=chess.piece, distance=...5] unless entity @n[type=interaction, tag=chess.piece, distance=...5, tag=chess.king, tag=!chess.black] run tag @s add chess.hit

## Pinning pieces
execute as @s[tag=chess.white] as @n[type=interaction, tag=chess.piece, tag=!chess.king, distance=...5] run tag @s add chess.partialPin
execute as @s[tag=chess.black] as @n[type=interaction, tag=chess.piece, tag=!chess.king, distance=...5] run tag @s add chess.partialPin

# Counting partial pins, if we're on a king
execute as @s[tag=chess.white] if entity @n[type=interaction, tag=chess.piece, tag=chess.king, tag=!chess.white, distance=...5] run function chess:game/movement/post_move/pin_piece
execute as @s[tag=chess.black] if entity @n[type=interaction, tag=chess.piece, tag=chess.king, tag=!chess.black, distance=...5] run function chess:game/movement/post_move/pin_piece

# Continue the ray if there's not a piece where we are right now, excluding kings of opposite color
execute if block ~ ~-.5 ~ #board positioned ^ ^ ^1.2 align xyz positioned ~.5 ~ ~.5 run function chess:game/movement/post_move/pseudo_valid/trace_spots_loop