execute store result score $this chess.gameID run scoreboard players get @s chess.gameID

function chess:pieces/movement/post_move/pseudo_valid/trace_spots_loop

tag @e[type=marker] remove chess.tempTrace
tag @e[type=interaction] remove chess.partialPin
tag @s remove chess.hit