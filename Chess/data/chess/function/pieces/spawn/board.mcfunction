$execute align xyz positioned ~.5 ~ ~.5 positioned ^1 ^ ^2 run function chess:pieces/spawn/black/pawn {ID: "$(ID)"}
$execute align xyz positioned ~.5 ~ ~.5 positioned ^2 ^ ^2 run function chess:pieces/spawn/black/pawn {ID: "$(ID)"}
$execute align xyz positioned ~.5 ~ ~.5 positioned ^3 ^ ^2 run function chess:pieces/spawn/black/pawn {ID: "$(ID)"}
$execute align xyz positioned ~.5 ~ ~.5 positioned ^4 ^ ^2 run function chess:pieces/spawn/black/pawn {ID: "$(ID)"}
$execute align xyz positioned ~.5 ~ ~.5 positioned ^5 ^ ^2 run function chess:pieces/spawn/black/pawn {ID: "$(ID)"}
$execute align xyz positioned ~.5 ~ ~.5 positioned ^6 ^ ^2 run function chess:pieces/spawn/black/pawn {ID: "$(ID)"}
$execute align xyz positioned ~.5 ~ ~.5 positioned ^7 ^ ^2 run function chess:pieces/spawn/black/pawn {ID: "$(ID)"}
$execute align xyz positioned ~.5 ~ ~.5 positioned ^8 ^ ^2 run function chess:pieces/spawn/black/pawn {ID: "$(ID)"}

$execute align xyz positioned ~.5 ~ ~.5 positioned ^1 ^ ^7 run function chess:pieces/spawn/white/pawn {ID: "$(ID)"}
$execute align xyz positioned ~.5 ~ ~.5 positioned ^2 ^ ^7 run function chess:pieces/spawn/white/pawn {ID: "$(ID)"}
$execute align xyz positioned ~.5 ~ ~.5 positioned ^3 ^ ^7 run function chess:pieces/spawn/white/pawn {ID: "$(ID)"}
$execute align xyz positioned ~.5 ~ ~.5 positioned ^4 ^ ^7 run function chess:pieces/spawn/white/pawn {ID: "$(ID)"}
$execute align xyz positioned ~.5 ~ ~.5 positioned ^5 ^ ^7 run function chess:pieces/spawn/white/pawn {ID: "$(ID)"}
$execute align xyz positioned ~.5 ~ ~.5 positioned ^6 ^ ^7 run function chess:pieces/spawn/white/pawn {ID: "$(ID)"}
$execute align xyz positioned ~.5 ~ ~.5 positioned ^7 ^ ^7 run function chess:pieces/spawn/white/pawn {ID: "$(ID)"}
$execute align xyz positioned ~.5 ~ ~.5 positioned ^8 ^ ^7 run function chess:pieces/spawn/white/pawn {ID: "$(ID)"}

$execute align xyz positioned ~.5 ~ ~.5 positioned ^1 ^ ^1 run function chess:pieces/spawn/black/rook {ID: "$(ID)"}
$execute align xyz positioned ~.5 ~ ~.5 positioned ^8 ^ ^1 run function chess:pieces/spawn/black/rook {ID: "$(ID)"}

$execute align xyz positioned ~.5 ~ ~.5 positioned ^1 ^ ^8 run function chess:pieces/spawn/white/rook {ID: "$(ID)"}
$execute align xyz positioned ~.5 ~ ~.5 positioned ^8 ^ ^8 run function chess:pieces/spawn/white/rook {ID: "$(ID)"}

$execute align xyz positioned ~.5 ~ ~.5 positioned ^2 ^ ^1 run function chess:pieces/spawn/black/knight {ID: "$(ID)"}
$execute align xyz positioned ~.5 ~ ~.5 positioned ^7 ^ ^1 run function chess:pieces/spawn/black/knight {ID: "$(ID)"}

$execute align xyz positioned ~.5 ~ ~.5 positioned ^2 ^ ^8 run function chess:pieces/spawn/white/knight {ID: "$(ID)"}
$execute align xyz positioned ~.5 ~ ~.5 positioned ^7 ^ ^8 run function chess:pieces/spawn/white/knight {ID: "$(ID)"}

$execute align xyz positioned ~.5 ~ ~.5 positioned ^3 ^ ^1 run function chess:pieces/spawn/black/bishop {ID: "$(ID)"}
$execute align xyz positioned ~.5 ~ ~.5 positioned ^6 ^ ^1 run function chess:pieces/spawn/black/bishop {ID: "$(ID)"}

$execute align xyz positioned ~.5 ~ ~.5 positioned ^3 ^ ^8 run function chess:pieces/spawn/white/bishop {ID: "$(ID)"}
$execute align xyz positioned ~.5 ~ ~.5 positioned ^6 ^ ^8 run function chess:pieces/spawn/white/bishop {ID: "$(ID)"}

$execute align xyz positioned ~.5 ~ ~.5 positioned ^4 ^ ^8 run function chess:pieces/spawn/white/queen {ID: "$(ID)"}
$execute align xyz positioned ~.5 ~ ~.5 positioned ^4 ^ ^1 run function chess:pieces/spawn/black/queen {ID: "$(ID)"}

$execute align xyz positioned ~.5 ~ ~.5 positioned ^5 ^ ^8 run function chess:pieces/spawn/white/king {ID: "$(ID)"}
$execute align xyz positioned ~.5 ~ ~.5 positioned ^5 ^ ^1 run function chess:pieces/spawn/black/king {ID: "$(ID)"}

execute align xyz positioned ~.5 ~4 ~.5 positioned ^4.5 ^ ^4.5 run summon marker ~ ~ ~ {Tags:["chess.boardData", "chess.turnWhite"]}
$execute align xyz positioned ~.5 ~4 ~.5 positioned ^4.5 ^ ^4.5 run scoreboard players set @n[type=marker] chess.gameID $(ID)

execute as @n[type=interaction, tag=chess.piece] run function chess:pieces/movement/post_move/post_move