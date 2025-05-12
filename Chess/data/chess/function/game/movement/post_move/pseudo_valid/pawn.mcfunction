# Attack diagonal pieces
execute align y positioned ^1 ^ ^1 run function chess:game/movement/post_move/mark_vulnerable
execute align y positioned ^-1 ^ ^1 run function chess:game/movement/post_move/mark_vulnerable