execute store result score $this chess.gameID run scoreboard players get @s chess.gameID

function chess:game/movement/post_move/pseudo_valid/trace_spots_loop

# If there's a king, mark all past traced markers as on path to check, and mark the king as checked
execute if entity @s[tag=chess.white] if entity @n[type=interaction, tag=chess.piece, tag=chess.king, tag=!chess.white, distance=...5] run tag @n[type=interaction, tag=chess.originTemp] add chess.checkOrigin
execute if entity @s[tag=chess.black] if entity @n[type=interaction, tag=chess.piece, tag=chess.king, tag=!chess.black, distance=...5] run tag @n[type=interaction, tag=chess.originTemp] add chess.checkOrigin

execute if entity @s[tag=chess.white] if entity @n[type=interaction, tag=chess.piece, tag=chess.king, tag=!chess.white, distance=...5] run tag @e[type=marker, tag=chess.tempTrace] add chess.checkPath
execute if entity @s[tag=chess.black] if entity @n[type=interaction, tag=chess.piece, tag=chess.king, tag=!chess.black, distance=...5] run tag @e[type=marker, tag=chess.tempTrace] add chess.checkPath

execute if entity @s[tag=chess.white] as @n[type=interaction, tag=chess.piece, tag=chess.king, tag=!chess.white, distance=...5] run tag @s add chess.checked
execute if entity @s[tag=chess.black] as @n[type=interaction, tag=chess.piece, tag=chess.king, tag=!chess.black, distance=...5] run tag @s add chess.checked

tag @e[type=marker] remove chess.tempTrace
tag @e[type=interaction] remove chess.partialPin
tag @s remove chess.hit