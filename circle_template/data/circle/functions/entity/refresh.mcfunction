scoreboard players operation #temp value = @s circle_alpha
scoreboard players operation #temp value *= #base circle_bold
scoreboard players operation #temp value += @s circle_bold
scoreboard players operation #temp value *= #base circle_radius
scoreboard players operation #temp value += @s circle_radius

execute store result entity @s ArmorItems[3].tag.display.color int 1.0 run scoreboard players get #temp value
execute store result entity @s ArmorItems[3].tag.CustomModelData int 1.0 run scoreboard players get @s circle_color