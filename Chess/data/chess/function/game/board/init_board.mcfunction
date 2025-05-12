## Arguments:
# - ID: Numerical unique identifier
# - TYPE: Game type: <normal>
$scoreboard players set $this chess.gameID $(ID)

# Kill any old markers with the same ID
kill @e[type=marker, tag=chess.boardData, predicate=chess:game_id]

# Summon a boardData marker
$execute align xyz positioned ~ ~ ~ run summon marker ~ ~ ~ {Tags:["chess.boardData", "chess.turnWhite", "chess.gameType.$(TYPE)"]}
execute align xyz positioned ~ ~ ~ store result score @n[type=marker] chess.gameID run scoreboard players get $this chess.gameID