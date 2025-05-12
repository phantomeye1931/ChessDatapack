# Drive forwards
tp @s ^ ^ ^.2

## Ride up/down (NOTE: THIS OVERRIDES THE DRIVING FORWARDS)
# up
execute if block ^ ^.8 ^ blackstone_slab run tp @s ^ ^.5 ^.2
execute if block ^ ^.2 ^ blackstone run tp @s ^ ^.5 ^.2
# down
execute if block ^ ^-.8 ^ blackstone_slab run tp @s ^ ^-.5 ^.2
execute if block ^ ^-.2 ^ air run tp @s ^ ^-.5 ^.2

execute as @n[type=armor_stand, distance=..0.2, tag=chess.traffic.left] run function chess:background/traffic/marker
execute as @n[type=armor_stand, distance=..0.2, tag=chess.traffic.right] run function chess:background/traffic/marker

particle large_smoke ^.5 ^.2 ^-5 0 0 0 0.05 1 force