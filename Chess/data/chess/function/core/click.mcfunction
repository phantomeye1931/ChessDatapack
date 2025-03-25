tag @s add chess.clicked

# # Ensure it's the player's turn
execute as @n[type=marker, tag=chess.boardData, tag=chess.turnWhite] if score @s chess.gameID = @n[type=interaction, tag=chess.clicked] chess.gameID as @n[type=interaction, tag=chess.clicked] on target run tag @s[team=Black] add chess.notMyTurn
execute as @n[type=marker, tag=chess.boardData, tag=chess.turnBlack] if score @s chess.gameID = @n[type=interaction, tag=chess.clicked] chess.gameID as @n[type=interaction, tag=chess.clicked] on target run tag @s[team=White] add chess.notMyTurn
execute on target as @s[tag=notMyTurn] run title @s actionbar {"text":"It's not your turn!"}

# Ensure the player is clicking a piece they're allowed to control
execute as @s[tag=chess.black,tag=!chess.capturable] on target as @s[team=!Black] run tag @s add chess.notMyTeam
execute as @s[tag=chess.white,tag=!chess.capturable] on target as @s[team=!White] run tag @s add chess.notMyTeam
execute as @s[tag=chess.white, tag=chess.capturable] on target as @s[team=White] run tag @s add chess.notMyTeam
execute as @s[tag=chess.black, tag=chess.capturable] on target as @s[team=Black] run tag @s add chess.notMyTeam
execute on target run title @s[tag=chess.notMyTeam] actionbar {"text":"That's not your piece!"}

# Compare the GameID
execute on target unless score @s chess.gameID = @n[tag=chess.clicked] chess.gameID run tag @s add chess.notMyGame
execute on target run title @s[tag=chess.notMyGame] actionbar {"text":"This is someone else's game!"}

# DEBUG
# tag @n[tag=clicked] add allowed

# Run clicking logic if allowed
execute unless entity @a[tag=chess.notMyGame] unless entity @a[tag=chess.notMyTeam] unless entity @a[tag=chess.notMyTurn] run function chess:core/allowed_click
execute on target run title @s[tag=!chess.notMyTeam, tag=!chess.notMyGame, tag=!chess.notMyTurn] actionbar {"text":""}

# Remove private temporary tags
tag @s remove chess.clicked
tag @a remove chess.notMyGame
tag @a remove chess.notMyTeam
tag @a remove chess.notMyTurn

data remove entity @s interaction