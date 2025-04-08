tag @s add chess.clicked

# Cooldown TODO fix
execute on target as @s[scores={chess.cooldownTimer=1..}] run data remove entity @n[type=interaction, tag=chess.clicked] interaction
execute on target as @s[scores={chess.cooldownTimer=1..}] run tag @n[type=interaction, tag=chess.clicked] remove chess.clicked
execute on target as @s[scores={chess.cooldownTimer=1..}] run return 1

execute on target run scoreboard players set @s[team=!Dev] chess.cooldownTimer 5

# Set gameID for checking
execute store result score $this chess.gameID run scoreboard players get @s chess.gameID

# Ensure it's the player's turn
execute if entity @n[type=marker, tag=chess.boardData, tag=chess.turnWhite, predicate=chess:game_id] on target run tag @s[team=!White] add chess.notMyTurn
execute if entity @n[type=marker, tag=chess.boardData, tag=chess.turnBlack, predicate=chess:game_id] on target run tag @s[team=!Black] add chess.notMyTurn

# Ensure the player is clicking a piece they're allowed to control
execute if entity @s[tag=chess.black, tag=!chess.capturable] on target as @s[team=!Black] run tag @s add chess.notMyTeam
execute if entity @s[tag=chess.white, tag=!chess.capturable] on target as @s[team=!White] run tag @s add chess.notMyTeam
execute if entity @s[tag=chess.white,  tag=chess.capturable] on target as @s[team=White] run tag @s add chess.notMyTeam
execute if entity @s[tag=chess.black,  tag=chess.capturable] on target as @s[team=Black] run tag @s add chess.notMyTeam

# Compare the GameID
execute on target run tag @s[predicate=!chess:game_id] add chess.notMyGame

execute if entity @s[tag=!chess.gameFinished, tag=!chess.gameNotStarted] on target as @s[tag=chess.notMyTurn] run title @s actionbar {"text":"It's not your turn!"}
execute if entity @s[tag=!chess.gameFinished, tag=!chess.gameNotStarted] on target run title @s[tag=chess.notMyTeam] actionbar {"text":"That's not your piece!"}
execute if entity @s[tag=!chess.gameFinished, tag=!chess.gameNotStarted] on target run title @s[tag=chess.notMyGame] actionbar {"text":"This is someone else's game!"}

# Decide if the player is trying to reset the board
execute if entity @s[tag=chess.gameFinished, tag=chess.mated     ] run tag @s add chess.reset
execute if entity @s[tag=chess.gameFinished, tag=chess.stalemated] run tag @s add chess.reset

execute if entity @s[tag=chess.gameNotStarted, tag=!chess.king] on target run title @s actionbar {"text":"This game hasn't started yet! Click a king to join it"}
execute if entity @s[tag=chess.gameFinished, tag=!chess.reset] on target run title @s actionbar {"text":"This game is finished! Click the king to reset the board"}

# Run clicking logic if allowed
execute if entity @s[tag=!chess.gameFinished] on target as @s[tag=!chess.notMyGame, tag=!chess.notMyTeam, tag=!chess.notMyTurn] run tag @s add chess.allowedClick
execute if entity @s[tag=chess.gameNotStarted, tag=chess.king] on target run tag @s add chess.allowedClick

# DEBUG
execute as @s[tag=!chess.gameFinished] on target as @s[team=Dev] run tag @s add chess.allowedClick

# Run the associated function
execute on target as @s[tag=chess.allowedClick] as @n[type=interaction, tag=chess.clicked] run function chess:core/allowed_click
execute if entity @s[tag=chess.reset] as @n[type=marker, tag=chess.boardData, predicate=chess:game_id] at @s run function chess:pieces/board/reset_board
execute on target unless entity @s[tag=!chess.allowedClick] unless entity @s[tag=!chess.reset] run title @s actionbar {"text":""}

# Remove private temporary tags
tag @s remove chess.clicked
tag @s remove chess.reset
execute on target run tag @s remove chess.notMyGame
execute on target run tag @s remove chess.notMyTeam
execute on target run tag @s remove chess.notMyTurn
execute on target run tag @s remove chess.allowedClick

data remove entity @s interaction