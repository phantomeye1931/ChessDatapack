# Set the teleport interpolation duration
execute as @s[distance=1..2] on vehicle run data merge entity @s {teleport_duration: 5}
execute as @s[distance=2..3] on vehicle run data merge entity @s {teleport_duration: 7}
execute as @s[distance=3..4] on vehicle run data merge entity @s {teleport_duration: 9}
execute as @s[distance=4..5] on vehicle run data merge entity @s {teleport_duration: 12}
execute as @s[distance=5..6] on vehicle run data merge entity @s {teleport_duration: 15}
execute as @s[distance=7.. ] on vehicle run data merge entity @s {teleport_duration: 18}

scoreboard players set @s chess.actionTimer 3
tag @s add chess.action.moving