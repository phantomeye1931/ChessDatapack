execute unless block ~ ~-1 ~ #board run return 1

# Place vulnerable markers
execute if entity @s[tag=chess.white, tag=chess.pawn] align xyz positioned ~.5 ~ ~.5 run summon marker ~ ~ ~ {Tags:["chess.spotMarker", "chess.white", "chess.vulnerable", "chess.pawn"]}
execute if entity @s[tag=chess.black, tag=chess.pawn] align xyz positioned ~.5 ~ ~.5 run summon marker ~ ~ ~ {Tags:["chess.spotMarker", "chess.black", "chess.vulnerable", "chess.pawn"]}

execute if entity @s[tag=chess.white, tag=chess.knight] align xyz positioned ~.5 ~ ~.5 run summon marker ~ ~ ~ {Tags:["chess.spotMarker", "chess.white", "chess.vulnerable", "chess.knight"]}
execute if entity @s[tag=chess.black, tag=chess.knight] align xyz positioned ~.5 ~ ~.5 run summon marker ~ ~ ~ {Tags:["chess.spotMarker", "chess.black", "chess.vulnerable", "chess.knight"]}

execute if entity @s[tag=chess.white, tag=chess.bishop] align xyz positioned ~.5 ~ ~.5 run summon marker ~ ~ ~ {Tags:["chess.spotMarker", "chess.white", "chess.vulnerable", "chess.tempTrace", "chess.bishop"]}
execute if entity @s[tag=chess.black, tag=chess.bishop] align xyz positioned ~.5 ~ ~.5 run summon marker ~ ~ ~ {Tags:["chess.spotMarker", "chess.black", "chess.vulnerable", "chess.tempTrace", "chess.bishop"]}

execute if entity @s[tag=chess.white, tag=chess.rook] align xyz positioned ~.5 ~ ~.5 run summon marker ~ ~ ~ {Tags:["chess.spotMarker", "chess.white", "chess.vulnerable", "chess.tempTrace", "chess.rook"]}
execute if entity @s[tag=chess.black, tag=chess.rook] align xyz positioned ~.5 ~ ~.5 run summon marker ~ ~ ~ {Tags:["chess.spotMarker", "chess.black", "chess.vulnerable", "chess.tempTrace", "chess.rook"]}

execute if entity @s[tag=chess.white, tag=chess.queen] align xyz positioned ~.5 ~ ~.5 run summon marker ~ ~ ~ {Tags:["chess.spotMarker", "chess.white", "chess.vulnerable", "chess.tempTrace", "chess.queen"]}
execute if entity @s[tag=chess.black, tag=chess.queen] align xyz positioned ~.5 ~ ~.5 run summon marker ~ ~ ~ {Tags:["chess.spotMarker", "chess.black", "chess.vulnerable", "chess.tempTrace", "chess.queen"]}

execute if entity @s[tag=chess.white, tag=chess.king] align xyz positioned ~.5 ~ ~.5 run summon marker ~ ~ ~ {Tags:["chess.spotMarker", "chess.white", "chess.vulnerable", "chess.king"]}
execute if entity @s[tag=chess.black, tag=chess.king] align xyz positioned ~.5 ~ ~.5 run summon marker ~ ~ ~ {Tags:["chess.spotMarker", "chess.black", "chess.vulnerable", "chess.king"]}

# Pass down Game ID
execute store result score @e[type=marker, distance=...5] chess.gameID run scoreboard players get @s chess.gameID

