# Switch turns
execute as @e[type=marker, tag=chess.boardData] if score @s chess.gameID = @n[type=interaction, tag=here] chess.gameID run function chess:core/switch_turns

# Cutesy particles :3
execute at @s run particle sonic_boom ~ ~.5 ~ 0 0 0 0 1

# Kill the stack, top to bottom
execute on passengers on passengers run tag @s add chess.shulker
tp @n[tag=chess.shulker] ~ ~-10000 ~
kill @n[tag=chess.shulker]

execute on passengers run kill @s
execute on vehicle run kill @s
kill @s