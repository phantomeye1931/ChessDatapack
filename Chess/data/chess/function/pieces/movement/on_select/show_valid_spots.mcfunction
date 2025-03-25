tag @s add chess.this

# Reset which pieces are considered capturable
tag @e[type=interaction, tag=chess.piece] remove chess.capturable

# Remove temporary private tags
tag @s remove chess.existsCheck
tag @s remove chess.this