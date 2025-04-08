# Increment the timers
execute as @a[scores={chess.cooldownTimer=1..}] run scoreboard players remove @s chess.cooldownTimer 1
execute as @e[scores={chess.actionTimer=1..}] run scoreboard players remove @s chess.actionTimer 1

# Teleporting to spots
execute as @e[type=interaction, scores={chess.actionTimer=1}, tag=chess.action.moving] at @s run function chess:core/teleport_to_spot
execute as @e[type=interaction, scores={chess.actionTimer=1}, tag=chess.action.moving] run tag @s remove chess.action.moving

execute as @e[type=interaction, scores={chess.actionTimer=1}, tag=chess.action.spawning] on vehicle run data merge entity @s {transformation:{scale:[1f, 1f, 1f]}}
execute as @e[type=interaction, scores={chess.actionTimer=1}, tag=chess.action.spawning] run tag @s remove chess.action.spawning

execute as @e[type=marker, scores={chess.actionTimer=1}, tag=chess.action.resetting] run function chess:pieces/board/repopulate
execute as @e[type=marker, scores={chess.actionTimer=1}, tag=chess.action.resetting] run tag @s remove chess.action.resetting

# execute as @e[type=item_display, tag=chess.validSpot, scores={chess.actionTimer=0}] run data merge entity @s {transformation: {translation:[0f, .5f, 0f]}}