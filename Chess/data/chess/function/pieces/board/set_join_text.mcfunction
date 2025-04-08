# Set text or spawn new text display with text
$execute as @n[type=text_display, distance=...5] run data merge entity @s $(NBT)
$execute unless entity @n[type=text_display, distance=...5] run summon text_display ~ ~ ~ $(NBT)