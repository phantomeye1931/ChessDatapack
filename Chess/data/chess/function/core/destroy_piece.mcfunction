# Cutesy particles :3
# execute at @s run particle sonic_boom ~ ~.5 ~ 0 0 0 0 1
execute at @s run playsound minecraft:block.stone.hit block @a ~ ~ ~ 1 1.4

execute at @s[tag=chess.black] positioned ~ ~.7 ~ run particle minecraft:block_crumble{block_state:{Name:"minecraft:polished_deepslate"}} ~ ~ ~ 0.2 0.4 0.2 1 30
execute at @s[tag=chess.white] positioned ~ ~.7 ~ run particle minecraft:block_crumble{block_state:{Name:"minecraft:polished_diorite"}} ~ ~ ~ 0.2 0.4 0.2 1 30

# Kill the stack, top to bottom
execute on passengers on passengers run tag @s add chess.shulker
tp @n[tag=chess.shulker] ~ ~-10000 ~
kill @n[tag=chess.shulker]

execute on passengers run kill @s
execute on vehicle run kill @s
kill @s