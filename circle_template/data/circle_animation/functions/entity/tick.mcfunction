execute if score @s value matches 10.. run kill @s

scoreboard players operation @s circle_radius = @s value
scoreboard players operation @s circle_radius *= #circle_animation_radius_speed value
scoreboard players operation @s circle_radius /= #100 value


scoreboard players operation #temp value = @s value
execute if score @s value >= #circle_animation_half_time value run scoreboard players operation #temp value = #circle_animation_time value
execute if score @s value >= #circle_animation_half_time value run scoreboard players operation #temp value -= @s value

scoreboard players operation @s circle_bold = #temp value
scoreboard players operation @s circle_bold *= #circle_animation_bold_speed value
scoreboard players operation @s circle_bold /= #100 value

scoreboard players operation @s circle_alpha = #temp value
scoreboard players operation @s circle_alpha *= #circle_animation_alpha_speed value
scoreboard players operation @s circle_alpha /= #100 value

function circle:entity/refresh
scoreboard players add @s value 1