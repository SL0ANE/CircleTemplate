scoreboard players set #100 value 100

scoreboard players set #circle_animation_half_time value 5
scoreboard players set #circle_animation_time value 10

scoreboard players set #circle_animation_radius_max value 30
scoreboard players operation #circle_animation_radius_speed value = #circle_animation_radius_max value
scoreboard players operation #circle_animation_radius_speed value *= #100 value
scoreboard players operation #circle_animation_radius_speed value /= #circle_animation_time value

scoreboard players set #circle_animation_alpha_max value 100
scoreboard players operation #circle_animation_alpha_speed value = #circle_animation_alpha_max value
scoreboard players operation #circle_animation_alpha_speed value *= #100 value
scoreboard players operation #circle_animation_alpha_speed value /= #circle_animation_half_time value

scoreboard players set #circle_animation_bold_max value 5
scoreboard players operation #circle_animation_bold_speed value = #circle_animation_bold_max value
scoreboard players operation #circle_animation_bold_speed value *= #100 value
scoreboard players operation #circle_animation_bold_speed value /= #circle_animation_half_time value

scoreboard objectives add click minecraft.used:minecraft.carrot_on_a_stick
scoreboard players set #raycast_range value 1280