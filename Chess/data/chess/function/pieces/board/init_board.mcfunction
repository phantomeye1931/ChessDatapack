$scoreboard players set $this chess.gameID $(ID)

# Kill any old markers with the same ID
kill @e[type=marker, tag=chess.boardData, predicate=chess:game_id]

# Summon a boardData marker
execute align xyz positioned ~.5 ~4 ~.5 positioned ^4.5 ^ ^4.5 run summon marker ~ ~ ~ {Tags:["chess.boardData", "chess.turnWhite"]}
execute align xyz positioned ~.5 ~4 ~.5 positioned ^4.5 ^ ^4.5 store result score @n[type=marker] chess.gameID run scoreboard players get $this chess.gameID

execute as @n[type=interaction, tag=chess.piece, predicate=chess:game_id] run function chess:pieces/movement/post_move/post_move