# Set game ID for compare
execute store result score $this chess.gameID run scoreboard players get @s chess.gameID
tag @e[predicate=chess:game_id] remove chess.gameNotStarted

kill @e[type=text_display, tag=chess.joinText, predicate=chess:game_id]

execute as @n[tag=chess.boardData] run function chess:game/movement/post_move/post_move