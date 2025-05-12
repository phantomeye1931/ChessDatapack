execute as @s[team=White] run tag @s add wasWhite
execute as @s[team=White] run team join Black @s
execute as @a[team=Black, tag=!wasWhite] run team join White @s

tag @s remove wasWhite