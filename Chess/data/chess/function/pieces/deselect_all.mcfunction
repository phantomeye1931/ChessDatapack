# For all pieces, compare game ID and deselect if it's the same
tag @s add chess.tempCompare
execute as @e[type=interaction, tag=chess.piece] if score @s chess.gameID = @n[type=interaction, tag=chess.tempCompare] chess.gameID run tag @s remove chess.selected
execute as @e[type=interaction, tag=chess.piece] if score @s chess.gameID = @n[type=interaction, tag=chess.tempCompare] chess.gameID run tag @s remove chess.capturable

# Kill all spots
execute as @e[type=interaction, tag=chess.validSpot] if score @s chess.gameID = @n[type=interaction, tag=chess.tempCompare] chess.gameID on vehicle run kill @s
execute as @e[type=interaction, tag=chess.validSpot] if score @s chess.gameID = @n[type=interaction, tag=chess.tempCompare] chess.gameID run kill @s
tag @s remove chess.tempCompare