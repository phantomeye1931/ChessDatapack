execute unless block ~ ~-1 ~ #board run return 1

# Place vulnerable markers
execute as @s[tag=chess.white, tag=chess.pawn] unless entity @n[type=interaction, distance=...5, tag=chess.piece, tag=chess.white] align xyz positioned ~.5 ~ ~.5 run summon marker ~ ~ ~ {Tags:["chess.spotMarker", "chess.white", "chess.vulnerable", "chess.tempTrace", "chess.pawn"]}
execute as @s[tag=chess.black, tag=chess.pawn] unless entity @n[type=interaction, distance=...5, tag=chess.piece, tag=chess.black] align xyz positioned ~.5 ~ ~.5 run summon marker ~ ~ ~ {Tags:["chess.spotMarker", "chess.black", "chess.vulnerable", "chess.tempTrace", "chess.pawn"]}

execute as @s[tag=chess.white, tag=chess.knight] unless entity @n[type=interaction, distance=...5, tag=chess.piece, tag=chess.white] align xyz positioned ~.5 ~ ~.5 run summon marker ~ ~ ~ {Tags:["chess.spotMarker", "chess.white", "chess.vulnerable", "chess.tempTrace", "chess.knight"]}
execute as @s[tag=chess.black, tag=chess.knight] unless entity @n[type=interaction, distance=...5, tag=chess.piece, tag=chess.black] align xyz positioned ~.5 ~ ~.5 run summon marker ~ ~ ~ {Tags:["chess.spotMarker", "chess.black", "chess.vulnerable", "chess.tempTrace", "chess.knight"]}

execute as @s[tag=chess.white, tag=chess.bishop] unless entity @n[type=interaction, distance=...5, tag=chess.piece, tag=chess.white] align xyz positioned ~.5 ~ ~.5 run summon marker ~ ~ ~ {Tags:["chess.spotMarker", "chess.white", "chess.vulnerable", "chess.tempTrace", "chess.bishop"]}
execute as @s[tag=chess.black, tag=chess.bishop] unless entity @n[type=interaction, distance=...5, tag=chess.piece, tag=chess.black] align xyz positioned ~.5 ~ ~.5 run summon marker ~ ~ ~ {Tags:["chess.spotMarker", "chess.black", "chess.vulnerable", "chess.tempTrace", "chess.bishop"]}

execute as @s[tag=chess.white, tag=chess.rook] unless entity @n[type=interaction, distance=...5, tag=chess.piece, tag=chess.white] align xyz positioned ~.5 ~ ~.5 run summon marker ~ ~ ~ {Tags:["chess.spotMarker", "chess.white", "chess.vulnerable", "chess.tempTrace", "chess.rook"]}
execute as @s[tag=chess.black, tag=chess.rook] unless entity @n[type=interaction, distance=...5, tag=chess.piece, tag=chess.black] align xyz positioned ~.5 ~ ~.5 run summon marker ~ ~ ~ {Tags:["chess.spotMarker", "chess.black", "chess.vulnerable", "chess.tempTrace", "chess.rook"]}

execute as @s[tag=chess.white, tag=chess.queen] unless entity @n[type=interaction, distance=...5, tag=chess.piece, tag=chess.white] align xyz positioned ~.5 ~ ~.5 run summon marker ~ ~ ~ {Tags:["chess.spotMarker", "chess.white", "chess.vulnerable", "chess.tempTrace", "chess.queen"]}
execute as @s[tag=chess.black, tag=chess.queen] unless entity @n[type=interaction, distance=...5, tag=chess.piece, tag=chess.black] align xyz positioned ~.5 ~ ~.5 run summon marker ~ ~ ~ {Tags:["chess.spotMarker", "chess.black", "chess.vulnerable", "chess.tempTrace", "chess.queen"]}

execute as @s[tag=chess.white, tag=chess.king] unless entity @n[type=interaction, distance=...5, tag=chess.piece, tag=chess.white] align xyz positioned ~.5 ~ ~.5 run summon marker ~ ~ ~ {Tags:["chess.spotMarker", "chess.white", "chess.vulnerable", "chess.tempTrace", "chess.king"]}
execute as @s[tag=chess.black, tag=chess.king] unless entity @n[type=interaction, distance=...5, tag=chess.piece, tag=chess.black] align xyz positioned ~.5 ~ ~.5 run summon marker ~ ~ ~ {Tags:["chess.spotMarker", "chess.black", "chess.vulnerable", "chess.tempTrace", "chess.king"]}

# Pass down Game ID
execute store result score @n[type=marker, distance=...5] chess.gameID run scoreboard players get @s chess.gameID

# If there's a king, mark all past traced markers as on path to check, and mark the king as checked
execute as @s[tag=chess.white] if entity @n[type=interaction, tag=chess.piece, tag=chess.king, tag=!chess.white, distance=...5] run tag @n[type=interaction, tag=chess.originTemp] add chess.checkOrigin
execute as @s[tag=chess.black] if entity @n[type=interaction, tag=chess.piece, tag=chess.king, tag=!chess.black, distance=...5] run tag @n[type=interaction, tag=chess.originTemp] add chess.checkOrigin

execute as @s[tag=chess.white] if entity @n[type=interaction, tag=chess.piece, tag=chess.king, tag=!chess.white, distance=...5] run tag @e[type=marker, tag=chess.tempTrace] add chess.checkPath
execute as @s[tag=chess.black] if entity @n[type=interaction, tag=chess.piece, tag=chess.king, tag=!chess.black, distance=...5] run tag @e[type=marker, tag=chess.tempTrace] add chess.checkPath

execute as @s[tag=chess.white] as @n[type=interaction, tag=chess.piece, tag=chess.king, tag=!chess.white, distance=...5] run tag @s add chess.checked
execute as @s[tag=chess.black] as @n[type=interaction, tag=chess.piece, tag=chess.king, tag=!chess.black, distance=...5] run tag @s add chess.checked