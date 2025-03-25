# Destroy all pieces
$execute as @e[tag=chess.piece,scores={chess.gameID=$(ID)}] run function chess:core/destroy_piece
$kill @e[type=marker, scores={chess.gameID=$(ID)}, tag=chess.boardData]