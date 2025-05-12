# If this position is off the board, return
execute unless block ~ ~-.5 ~ #board run return 1

# Mark this position
function chess:game/movement/on_select/validate_spot

# Continue the ray if there's not a piece where we are right now
execute unless entity @n[type=interaction, tag=chess.piece, distance=...2] positioned ^ ^ ^1.2 align xyz positioned ~.5 ~ ~.5 run function chess:game/movement/on_select/valid/trace_spots