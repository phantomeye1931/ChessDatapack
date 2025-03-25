# Attack diagonal pieces
execute align y positioned ^1 ^ ^1 as @n[type=interaction, tag=chess.piece, distance=...5] run function chess:pieces/movement/post_move/pseudo_valid/mark_valid
execute align y positioned ^-1 ^ ^1 as @n[type=interaction, tag=chess.piece, distance=...5] run function chess:pieces/movement/post_move/pseudo_valid/mark_valid