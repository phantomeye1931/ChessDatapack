# A piece was selected
execute if entity @s[tag=!chess.gameNotStarted, tag=chess.piece, tag=!chess.capturable] run function chess:pieces/movement/on_select/click_piece

# A valid spot, or attackable piece was selected
execute if entity @s[tag=!chess.gameNotStarted, tag=chess.piece, tag=chess.capturable] run tag @s add chess.moveHere
execute if entity @s[tag=!chess.gameNotStarted, tag=chess.validSpot] run tag @s add chess.moveHere

execute if entity @s[tag=!chess.gameNotStarted, tag=chess.piece, tag=chess.capturable] as @n[type=interaction, tag=chess.selected] run function chess:core/click_spot
execute if entity @s[tag=!chess.gameNotStarted, tag=chess.validSpot] as @n[type=interaction, tag=chess.selected] run function chess:core/click_spot

# A player is trying to join a team
execute if entity @s[tag=chess.gameNotStarted, tag=chess.king] run function chess:pieces/board/join_team