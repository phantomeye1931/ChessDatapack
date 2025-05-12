# Already has a player
execute if entity @s[tag=chess.white] if entity @p[team=White, predicate=chess:game_id] on target run title @s[team=!White, predicate=chess:game_id] actionbar {"text":"Someone already joined this side!"} 
execute if entity @s[tag=chess.black] if entity @p[team=Black, predicate=chess:game_id] on target run title @s[team=!Black, predicate=chess:game_id] actionbar {"text":"Someone already joined this side!"}

# Leaving side
execute if entity @s[tag=chess.white] on target run title @s[team=White, predicate=chess:game_id] actionbar {"text":"Left white side!"} 
execute if entity @s[tag=chess.black] on target run title @s[team=Black, predicate=chess:game_id] actionbar {"text":"Left black side!"}

execute if entity @s[tag=chess.white] if entity @p[team=White, predicate=chess:game_id] on target run tag @s[team=White, predicate=chess:game_id] add chess.leaveTeam
execute if entity @s[tag=chess.black] if entity @p[team=Black, predicate=chess:game_id] on target run tag @s[team=Black, predicate=chess:game_id] add chess.leaveTeam

team leave @a[tag=chess.leaveTeam]

# Join this board and team
execute on target store result score @s chess.gameID run scoreboard players get @n[type=interaction, tag=chess.clicked] chess.gameID
execute if entity @s[tag=chess.white] on target run team join White @s[tag=!chess.leaveTeam]
execute if entity @s[tag=chess.black] on target run team join Black @s[tag=!chess.leaveTeam]

# Game starting
execute if entity @p[team=White, predicate=chess:game_id] if entity @p[team=Black, predicate=chess:game_id] run tag @e[predicate=chess:game_id] remove chess.gameNotStarted
execute if entity @p[team=White, predicate=chess:game_id] if entity @p[team=Black, predicate=chess:game_id] as @n[type=marker, tag=chess.boardData] run function chess:game/movement/post_move/post_move

# Update the join text
function chess:game/board/place_join_text

tag @a remove chess.leaveTeam