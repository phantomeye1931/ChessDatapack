tag @s add chess.clicked

execute if entity @s[tag=chess.piece] run function chess:core/click_chess
execute if entity @s[tag=chess.validSpot] run function chess:core/click_chess

# Remove private temporary tags
tag @s remove chess.clicked
data remove entity @s interaction