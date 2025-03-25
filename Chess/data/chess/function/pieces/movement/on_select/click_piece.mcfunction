# Play a sound
execute if entity @s[tag=chess.piece] run playsound minecraft:block.stone.hit block @a ~ ~ ~ 1 1.8

# Deselect all, and only select this piece if it wasn't already selected
tag @s[tag=chess.selected] add chess.alreadySelected
function chess:pieces/deselect_all

# Change the selection to the new piece
execute if entity @s[tag=!chess.alreadySelected] run tag @s add chess.selected

# Show the valid spots
execute if entity @s[tag=!chess.alreadySelected, tag=chess.pawn  ] at @s run function chess:pieces/movement/on_select/valid/pawn
execute if entity @s[tag=!chess.alreadySelected, tag=chess.rook  ] at @s run function chess:pieces/movement/on_select/valid/rook
execute if entity @s[tag=!chess.alreadySelected, tag=chess.knight] at @s run function chess:pieces/movement/on_select/valid/knight
execute if entity @s[tag=!chess.alreadySelected, tag=chess.bishop] at @s run function chess:pieces/movement/on_select/valid/bishop
execute if entity @s[tag=!chess.alreadySelected, tag=chess.queen ] at @s run function chess:pieces/movement/on_select/valid/queen
execute if entity @s[tag=!chess.alreadySelected, tag=chess.king  ] at @s run function chess:pieces/movement/on_select/valid/king

# Remove private temporary tags
tag @s remove chess.alreadySelected