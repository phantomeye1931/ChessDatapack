# Set game ID for compare
execute store result score $this chess.gameID run scoreboard players get @s chess.gameID

kill @e[type=text_display, tag=chess.mateText, predicate=chess:game_id]
kill @e[type=text_display, tag=chess.stalemateText, predicate=chess:game_id]

tag @s remove chess.whiteCanMove
tag @s remove chess.blackCanMove
tag @s remove chess.whiteChecked
tag @s remove chess.blackChecked

tag @e[type=interaction, predicate=chess:game_id] remove chess.mated

# Check for checked parties
execute if entity @n[type=interaction, tag=chess.checked, tag=chess.white, predicate=chess:game_id] run tag @s add chess.whiteChecked
execute if entity @n[type=interaction, tag=chess.checked, tag=chess.black, predicate=chess:game_id] run tag @s add chess.blackChecked

# Check whether the parties can move
execute if entity @e[type=marker, tag=chess.validMove, tag=chess.white, predicate=chess:game_id] run tag @s add chess.whiteCanMove
execute if entity @e[type=marker, tag=chess.validMove, tag=chess.black, predicate=chess:game_id] run tag @s add chess.blackCanMove

# Draw a conclusion
execute as @s[tag=!chess.whiteCanMove, tag=chess.whiteChecked] at @s positioned ~ ~-4 ~ run function chess:events/celebrations/black_wins
execute as @s[tag=!chess.blackCanMove, tag=chess.blackChecked] at @s positioned ~ ~-4 ~ run function chess:events/celebrations/white_wins

# Mark the king as mated if it is
execute as @s[tag=!chess.whiteCanMove, tag=chess.whiteChecked] run tag @n[type=interaction, tag=chess.checked, tag=chess.white, predicate=chess:game_id] add chess.mated
execute as @s[tag=!chess.blackCanMove, tag=chess.blackChecked] run tag @n[type=interaction, tag=chess.checked, tag=chess.black, predicate=chess:game_id] add chess.mated

execute if entity @s[tag=chess.turnWhite, tag=!chess.whiteCanMove, tag=!chess.whiteChecked] run tag @n[type=interaction, tag=chess.king, tag=chess.white, predicate=chess:game_id] add chess.stalemated
execute if entity @s[tag=chess.turnBlack, tag=!chess.blackCanMove, tag=!chess.blackChecked] run tag @n[type=interaction, tag=chess.king, tag=chess.black, predicate=chess:game_id] add chess.stalemated

# Mark the pieces of the game with the fact that this game is finished
execute if entity @n[type=interaction, predicate=chess:game_id, tag=chess.mated] run tag @e[type=interaction, tag=chess.piece, predicate=chess:game_id] add chess.gameFinished
execute if entity @n[type=interaction, predicate=chess:game_id, tag=chess.stalemated] run tag @e[type=interaction, tag=chess.piece, predicate=chess:game_id] add chess.gameFinished

# Add text above mated king
execute as @e[type=interaction, tag=chess.mated, tag=chess.white, predicate=chess:game_id] at @s run summon text_display ^.2 ^2.2 ^-.2 {billboard:"center", shadow:1b, alignment:"center", background:0, text:[{"bold":true, "text":"CHECKMATE", "color":"#e6e2e6"}, {"text":"\nclick to reset", "color":"#babbc0"}], Tags:["chess.text", "chess.mateText"]}
execute as @e[type=interaction, tag=chess.mated, tag=chess.black, predicate=chess:game_id] at @s run summon text_display ^.2 ^2.2 ^-.2 {billboard:"center", shadow:1b, alignment:"center", background:0, text:[{"bold":true, "text":"CHECKMATE", "color":"#a9aca9"}, {"text":"\nclick to reset", "color":"#6e6e6e"}], Tags:["chess.text", "chess.mateText"]}

# Add text above stalemated king
execute as @n[type=interaction, tag=chess.stalemated, tag=chess.white, predicate=chess:game_id] at @s run summon text_display ~ ~2 ~ {billboard:"center", shadow:1b, alignment:"center", background:0, text:[{"bold":true, "text":"STALEMATE", "color":"#e6e2e6"}, {"text":"\nclick to reset", "color":"#babbc0"}], Tags:["chess.text", "chess.stalemateText"]}
execute as @n[type=interaction, tag=chess.stalemated, tag=chess.black, predicate=chess:game_id] at @s run summon text_display ~ ~2 ~ {billboard:"center", shadow:1b, alignment:"center", background:0, text:[{"bold":true, "text":"STALEMATE", "color":"#a9aca9"}, {"text":"\nclick to reset", "color":"#6e6e6e"}], Tags:["chess.text", "chess.stalemateText"]}

# Pass down the game ID
execute as @e[type=interaction, tag=chess.king, predicate=chess:game_id] at @s positioned ^.2 ^2.2 ^-.2 store result score @e[type=text_display, distance=..1] chess.gameID run scoreboard players get @s chess.gameID