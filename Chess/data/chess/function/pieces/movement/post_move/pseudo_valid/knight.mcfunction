# Mark in 8 spots surrounding it
execute align y facing ~1 ~ ~2 positioned ~1 ~ ~2 if block ~ ~-.5 ~ #board run function chess:pieces/movement/post_move/mark_pseudo
execute align y facing ~-1 ~ ~2 positioned ~-1 ~ ~2 if block ~ ~-.5 ~ #board run function chess:pieces/movement/post_move/mark_pseudo
execute align y facing ~1 ~ ~-2 positioned ~1 ~ ~-2 if block ~ ~-.5 ~ #board run function chess:pieces/movement/post_move/mark_pseudo
execute align y facing ~-1 ~ ~-2 positioned ~-1 ~ ~-2 if block ~ ~-.5 ~ #board run function chess:pieces/movement/post_move/mark_pseudo
execute align y facing ~2 ~ ~1 positioned ~2 ~ ~1 if block ~ ~-.5 ~ #board run function chess:pieces/movement/post_move/mark_pseudo
execute align y facing ~-2 ~ ~1 positioned ~-2 ~ ~1 if block ~ ~-.5 ~ #board run function chess:pieces/movement/post_move/mark_pseudo
execute align y facing ~2 ~ ~-1 positioned ~2 ~ ~-1 if block ~ ~-.5 ~ #board run function chess:pieces/movement/post_move/mark_pseudo
execute align y facing ~-2 ~ ~-1 positioned ~-2 ~ ~-1 if block ~ ~-.5 ~ #board run function chess:pieces/movement/post_move/mark_pseudo