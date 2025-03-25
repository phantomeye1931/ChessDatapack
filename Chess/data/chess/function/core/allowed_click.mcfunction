# A piece was selected
execute if entity @s[tag=chess.piece, tag=!chess.attacked] run function chess:pieces/movement/on_select/click_piece

# A valid spot, or attackable piece was selected
execute if entity @s[tag=chess.piece, tag=chess.attacked] run function chess:core/click_spot
execute if entity @s[tag=chess.validSpot] run function chess:core/click_spot