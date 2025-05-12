# Checking all sides of the player's hitbox
execute if block ~0.4 ~100 ~ barrier run title @s actionbar "You can't go further!"
execute if block ~-0.4 ~100 ~ barrier run title @s actionbar "You can't go further!"
execute if block ~ ~100 ~-0.4 barrier run title @s actionbar "You can't go further!"
execute if block ~ ~100 ~0.4 barrier run title @s actionbar "You can't go further!"