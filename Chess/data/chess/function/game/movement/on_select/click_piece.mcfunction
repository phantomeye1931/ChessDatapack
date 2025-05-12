# Play a sound
execute if entity @s[tag=chess.piece] run playsound minecraft:block.stone.hit block @a ~ ~ ~ 1 1.8

# Deselect all, and only select this piece if it wasn't already selected
tag @s[tag=chess.selected] add chess.alreadySelected
function chess:game/deselect_all

# Change the selection to the new piece
execute if entity @s[tag=!chess.alreadySelected] run tag @s add chess.selected

function chess:game/movement/on_select/show_valid_spots

function chess:core/animate