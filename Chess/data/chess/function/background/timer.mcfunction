# Increment timers
scoreboard players add $2 chess.tickTimer 1
scoreboard players add $4 chess.tickTimer 1

# Reset timers
execute if score $2 chess.tickTimer matches 2 run scoreboard players set $2 chess.tickTimer 0
execute if score $4 chess.tickTimer matches 4 run scoreboard players set $4 chess.tickTimer 0