# If this position is off the board, return
execute unless block ~ ~-.5 ~ #board run return 1

# Mark this position
function chess:pieces/movement/on_select/validate_spot

# Continue the ray if there's not a piece where we are right now
execute unless entity @n[tag=chess.piece, distance=...2] positioned ^ ^ ^1.414214 run function chess:pieces/movement/on_select/valid/trace_diagonal

# If this is the end of the ray, remove all temporary ray tags
execute if entity @n[tag=chess.piece, distance=...2] run tag @e[type=interaction] remove chess.tempTrace