# If not pinned, return 1 (allowed)
execute as @s[tag=!chess.pinned] run return 1

# Check
execute as @s[tag=chess.white] at @s facing entity @n[type=interaction, tag=chess.white, tag=chess.king, predicate=chess:game_id] feet run rotate @s ~ 0
execute as @s[tag=chess.black] at @s facing entity @n[type=interaction, tag=chess.black, tag=chess.king, predicate=chess:game_id] feet run rotate @s ~ 0

execute as @s[tag=chess.white] facing entity @n[type=interaction, tag=chess.white, tag=chess.king, predicate=chess:game_id] feet positioned as @s positioned ^ ^ ^1 rotated as @s positioned ^ ^ ^-1 if entity @s[distance=..0.01] run return 1
execute as @s[tag=chess.black] facing entity @n[type=interaction, tag=chess.black, tag=chess.king, predicate=chess:game_id] feet positioned as @s positioned ^ ^ ^1 rotated as @s positioned ^ ^ ^-1 if entity @s[distance=..0.01] run return 1

return 0