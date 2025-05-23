# Reset the partial pin counter
scoreboard players set $partialPins chess.counter 0

# Count how many pieces have the partialPins tag
execute as @e[type=interaction, tag=chess.partialPin, predicate=chess:game_id] run scoreboard players add $partialPins chess.counter 1

execute if entity @s[tag=chess.white] if score $partialPins chess.counter matches 1 run tag @e[type=interaction, tag=chess.black, tag=chess.partialPin, predicate=chess:game_id] add chess.pinned
execute if entity @s[tag=chess.black] if score $partialPins chess.counter matches 1 run tag @e[type=interaction, tag=chess.white, tag=chess.partialPin, predicate=chess:game_id] add chess.pinned