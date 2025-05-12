## Progress the time
# At night - Every 2 ticks (20m night)
execute if score $2 chess.tickTimer matches 0 if score $current chess.dayTime matches 13000.. run time add 1

# At daytime - Every 4 ticks (40m day)
execute if score $4 chess.tickTimer matches 0 if score $current chess.dayTime matches ..13000 run time add 1