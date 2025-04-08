tag @s add chess.this

# Reset which pieces are considered capturable
tag @e[type=interaction, tag=chess.piece] remove chess.capturable

# Show the valid spots
execute as @s[tag=!chess.alreadySelected, tag=chess.pawn  ] at @s run function chess:pieces/movement/on_select/valid/pawn
execute as @s[tag=!chess.alreadySelected, tag=chess.rook  ] at @s run function chess:pieces/movement/on_select/valid/rook
execute as @s[tag=!chess.alreadySelected, tag=chess.knight] at @s run function chess:pieces/movement/on_select/valid/knight
execute as @s[tag=!chess.alreadySelected, tag=chess.bishop] at @s run function chess:pieces/movement/on_select/valid/bishop
execute as @s[tag=!chess.alreadySelected, tag=chess.queen ] at @s run function chess:pieces/movement/on_select/valid/queen
execute as @s[tag=!chess.alreadySelected, tag=chess.king  ] at @s run function chess:pieces/movement/on_select/valid/king

# Remove private temporary tags
tag @s remove chess.alreadySelected

# Remove temporary private tags
tag @s remove chess.existsCheck
tag @s remove chess.this