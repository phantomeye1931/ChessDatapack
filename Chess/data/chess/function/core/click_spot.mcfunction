# Teleport the selected piece to this spot
tag @s add chess.moveHere
execute as @n[tag=chess.selected, distance=1..2] on vehicle run data merge entity @s {teleport_duration: 5}
execute as @n[tag=chess.selected, distance=2..3] on vehicle run data merge entity @s {teleport_duration: 7}
execute as @n[tag=chess.selected, distance=3..4] on vehicle run data merge entity @s {teleport_duration: 9}
execute as @n[tag=chess.selected, distance=4..5] on vehicle run data merge entity @s {teleport_duration: 12}
execute as @n[tag=chess.selected, distance=5..6] on vehicle run data merge entity @s {teleport_duration: 15}
execute as @n[tag=chess.selected, distance=7.. ] on vehicle run data merge entity @s {teleport_duration: 18}

schedule function chess:core/teleport_to_spot 2

# # DEBUG
# tag @p[team=White] add wasWhite
# team join White @p[team=Black]
# team join Black @p[tag=wasWhite]
# tag @p remove wasWhite

# say Switched teams!