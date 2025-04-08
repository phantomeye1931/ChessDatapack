execute at @s positioned ^-3.5 ^-4 ^2.5 run function chess:pieces/board/spawn_piece {ID: "0", TYPE: "pawn", HEIGHT: "1.0625", COLOR: "white"}
execute at @s positioned ^-2.5 ^-4 ^2.5 run function chess:pieces/board/spawn_piece {ID: "0", TYPE: "pawn", HEIGHT: "1.0625", COLOR: "white"}
execute at @s positioned ^-1.5 ^-4 ^2.5 run function chess:pieces/board/spawn_piece {ID: "0", TYPE: "pawn", HEIGHT: "1.0625", COLOR: "white"}
execute at @s positioned ^-0.5 ^-4 ^2.5 run function chess:pieces/board/spawn_piece {ID: "0", TYPE: "pawn", HEIGHT: "1.0625", COLOR: "white"}
execute at @s positioned ^0.5 ^-4 ^2.5 run function chess:pieces/board/spawn_piece {ID: "0", TYPE: "pawn", HEIGHT: "1.0625", COLOR: "white"}
execute at @s positioned ^1.5 ^-4 ^2.5 run function chess:pieces/board/spawn_piece {ID: "0", TYPE: "pawn", HEIGHT: "1.0625", COLOR: "white"}
execute at @s positioned ^2.5 ^-4 ^2.5 run function chess:pieces/board/spawn_piece {ID: "0", TYPE: "pawn", HEIGHT: "1.0625", COLOR: "white"}
execute at @s positioned ^3.5 ^-4 ^2.5 run function chess:pieces/board/spawn_piece {ID: "0", TYPE: "pawn", HEIGHT: "1.0625", COLOR: "white"}

execute at @s positioned ^-3.5 ^-4 ^-2.5 run function chess:pieces/board/spawn_piece {ID: "0", TYPE: "pawn", HEIGHT: "1.0625", COLOR: "black"}
execute at @s positioned ^-2.5 ^-4 ^-2.5 run function chess:pieces/board/spawn_piece {ID: "0", TYPE: "pawn", HEIGHT: "1.0625", COLOR: "black"}
execute at @s positioned ^-1.5 ^-4 ^-2.5 run function chess:pieces/board/spawn_piece {ID: "0", TYPE: "pawn", HEIGHT: "1.0625", COLOR: "black"}
execute at @s positioned ^-0.5 ^-4 ^-2.5 run function chess:pieces/board/spawn_piece {ID: "0", TYPE: "pawn", HEIGHT: "1.0625", COLOR: "black"}
execute at @s positioned ^0.5 ^-4 ^-2.5 run function chess:pieces/board/spawn_piece {ID: "0", TYPE: "pawn", HEIGHT: "1.0625", COLOR: "black"}
execute at @s positioned ^1.5 ^-4 ^-2.5 run function chess:pieces/board/spawn_piece {ID: "0", TYPE: "pawn", HEIGHT: "1.0625", COLOR: "black"}
execute at @s positioned ^2.5 ^-4 ^-2.5 run function chess:pieces/board/spawn_piece {ID: "0", TYPE: "pawn", HEIGHT: "1.0625", COLOR: "black"}
execute at @s positioned ^3.5 ^-4 ^-2.5 run function chess:pieces/board/spawn_piece {ID: "0", TYPE: "pawn", HEIGHT: "1.0625", COLOR: "black"}

execute at @s positioned ^-3.5 ^-4 ^3.5 run function chess:pieces/board/spawn_piece {ID: "0", TYPE: "rook", HEIGHT: "1.1875", COLOR: "white"}
execute at @s positioned ^3.5 ^-4 ^3.5 run function chess:pieces/board/spawn_piece {ID: "0", TYPE: "rook", HEIGHT: "1.1875", COLOR: "white"}

execute at @s positioned ^-3.5 ^-4 ^-3.5 run function chess:pieces/board/spawn_piece {ID: "0", TYPE: "rook", HEIGHT: "1.1875", COLOR: "black"}
execute at @s positioned ^3.5 ^-4 ^-3.5 run function chess:pieces/board/spawn_piece {ID: "0", TYPE: "rook", HEIGHT: "1.1875", COLOR: "black"}

execute at @s positioned ^-2.5 ^-4 ^3.5 run function chess:pieces/board/spawn_piece {ID: "0", TYPE: "knight", HEIGHT: "1.1875", COLOR: "white"}
execute at @s positioned ^2.5 ^-4 ^3.5 run function chess:pieces/board/spawn_piece {ID: "0", TYPE: "knight", HEIGHT: "1.1875", COLOR: "white"}

execute at @s positioned ^-2.5 ^-4 ^-3.5 run function chess:pieces/board/spawn_piece {ID: "0", TYPE: "knight", HEIGHT: "1.1875", COLOR: "black"}
execute at @s positioned ^2.5 ^-4 ^-3.5 run function chess:pieces/board/spawn_piece {ID: "0", TYPE: "knight", HEIGHT: "1.1875", COLOR: "black"}

execute at @s positioned ^-1.5 ^-4 ^3.5 run function chess:pieces/board/spawn_piece {ID: "0", TYPE: "bishop", HEIGHT: "1.3125", COLOR: "white"}
execute at @s positioned ^1.5 ^-4 ^3.5 run function chess:pieces/board/spawn_piece {ID: "0", TYPE: "bishop", HEIGHT: "1.3125", COLOR: "white"}

execute at @s positioned ^-1.5 ^-4 ^-3.5 run function chess:pieces/board/spawn_piece {ID: "0", TYPE: "bishop", HEIGHT: "1.3125", COLOR: "black"}
execute at @s positioned ^1.5 ^-4 ^-3.5 run function chess:pieces/board/spawn_piece {ID: "0", TYPE: "bishop", HEIGHT: "1.3125", COLOR: "black"}

execute at @s positioned ^-0.5 ^-4 ^3.5 run function chess:pieces/board/spawn_piece {ID: "0", TYPE: "queen", HEIGHT: "1.5", COLOR: "white"}
execute at @s positioned ^-0.5 ^-4 ^-3.5 run function chess:pieces/board/spawn_piece {ID: "0", TYPE: "queen", HEIGHT: "1.5", COLOR: "black"}

execute at @s positioned ^0.5 ^-4 ^3.5 run function chess:pieces/board/spawn_piece {ID: "0", TYPE: "king", HEIGHT: "1.5", COLOR: "white"}
execute at @s positioned ^0.5 ^-4 ^-3.5 run function chess:pieces/board/spawn_piece {ID: "0", TYPE: "king", HEIGHT: "1.5", COLOR: "black"}

# Pass down the game ID
execute at @e[type=interaction, tag=chess.boardThis] store result score @e[type=!player, distance=...5] chess.gameID run scoreboard players get @s chess.gameID

# Remove temporary tag
tag @e[type=interaction] remove chess.boardThis

# Mark the board kings as joinable
function chess:pieces/board/place_join_text

# Do post-move stuff
function chess:pieces/movement/post_move/post_move