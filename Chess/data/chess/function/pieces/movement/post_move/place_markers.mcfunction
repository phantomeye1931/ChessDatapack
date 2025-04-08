# Mark all pseudo-valid positions on the board, for this piece
tag @s add chess.originTemp
execute if entity @s[tag=chess.pawn  ] at @s run function chess:pieces/movement/post_move/pseudo_valid/pawn
execute if entity @s[tag=chess.rook  ] at @s run function chess:pieces/movement/post_move/pseudo_valid/rook
execute if entity @s[tag=chess.knight] at @s run function chess:pieces/movement/post_move/pseudo_valid/knight
execute if entity @s[tag=chess.bishop] at @s run function chess:pieces/movement/post_move/pseudo_valid/bishop
execute if entity @s[tag=chess.queen ] at @s run function chess:pieces/movement/post_move/pseudo_valid/queen
execute if entity @s[tag=chess.king  ] at @s run function chess:pieces/movement/post_move/pseudo_valid/king

# Remove temporary private tags
tag @s remove chess.originTemp
