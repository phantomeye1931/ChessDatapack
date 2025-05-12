# Set game ID for compare
execute store result score $this chess.gameID run scoreboard players get @s chess.gameID

execute at @s as @e[tag=chess.placement.white.pawn,   distance=..20] at @s run function chess:game/board/spawn_piece {TYPE: "pawn",   HEIGHT: "1.0625", COLOR: "white"}
execute at @s as @e[tag=chess.placement.black.pawn,   distance=..20] at @s run function chess:game/board/spawn_piece {TYPE: "pawn",   HEIGHT: "1.0625", COLOR: "black"}
execute at @s as @e[tag=chess.placement.white.bishop, distance=..20] at @s run function chess:game/board/spawn_piece {TYPE: "bishop", HEIGHT: "1.3125", COLOR: "white"}
execute at @s as @e[tag=chess.placement.black.bishop, distance=..20] at @s run function chess:game/board/spawn_piece {TYPE: "bishop", HEIGHT: "1.3125", COLOR: "black"}
execute at @s as @e[tag=chess.placement.white.rook,   distance=..20] at @s run function chess:game/board/spawn_piece {TYPE: "rook",   HEIGHT: "1.1875", COLOR: "white"}
execute at @s as @e[tag=chess.placement.black.rook,   distance=..20] at @s run function chess:game/board/spawn_piece {TYPE: "rook",   HEIGHT: "1.1875", COLOR: "black"}
execute at @s as @e[tag=chess.placement.white.knight, distance=..20] at @s run function chess:game/board/spawn_piece {TYPE: "knight", HEIGHT: "1.1875", COLOR: "white"}
execute at @s as @e[tag=chess.placement.black.knight, distance=..20] at @s run function chess:game/board/spawn_piece {TYPE: "knight", HEIGHT: "1.1875", COLOR: "black"}
execute at @s as @e[tag=chess.placement.white.queen,  distance=..20] at @s run function chess:game/board/spawn_piece {TYPE: "queen",  HEIGHT: "1.5",    COLOR: "white"}
execute at @s as @e[tag=chess.placement.black.queen,  distance=..20] at @s run function chess:game/board/spawn_piece {TYPE: "queen",  HEIGHT: "1.5",    COLOR: "black"}
execute at @s as @e[tag=chess.placement.white.king,   distance=..20] at @s run function chess:game/board/spawn_piece {TYPE: "king",   HEIGHT: "1.5",    COLOR: "white"}
execute at @s as @e[tag=chess.placement.black.king,   distance=..20] at @s run function chess:game/board/spawn_piece {TYPE: "king",   HEIGHT: "1.5",    COLOR: "black"}

# Remove temporary tag
tag @e[type=interaction] remove chess.boardThis

# Mark the board kings as joinable
function chess:game/board/place_join_text

# Do post-move stuff
function chess:game/movement/post_move/post_move