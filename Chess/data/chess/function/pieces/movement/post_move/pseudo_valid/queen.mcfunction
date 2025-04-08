# Trace diagonal
execute align y facing ~1 ~ ~1 positioned ~1 ~ ~1 run function chess:pieces/movement/post_move/pseudo_valid/trace_spots
execute align y facing ~1 ~ ~-1 positioned ~1 ~ ~-1 run function chess:pieces/movement/post_move/pseudo_valid/trace_spots
execute align y facing ~-1 ~ ~1 positioned ~-1 ~ ~1 run function chess:pieces/movement/post_move/pseudo_valid/trace_spots
execute align y facing ~-1 ~ ~-1 positioned ~-1 ~ ~-1 run function chess:pieces/movement/post_move/pseudo_valid/trace_spots

# Trace straight
execute align y facing ~ ~ ~1 positioned ~ ~ ~1 run function chess:pieces/movement/post_move/pseudo_valid/trace_spots
execute align y facing ~1 ~ ~ positioned ~1 ~ ~ run function chess:pieces/movement/post_move/pseudo_valid/trace_spots
execute align y facing ~ ~ ~-1 positioned ~ ~ ~-1 run function chess:pieces/movement/post_move/pseudo_valid/trace_spots
execute align y facing ~-1 ~ ~ positioned ~-1 ~ ~ run function chess:pieces/movement/post_move/pseudo_valid/trace_spots