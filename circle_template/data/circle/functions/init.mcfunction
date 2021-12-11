scoreboard objectives add value dummy

scoreboard players set #base circle_radius 1024
scoreboard players set #base circle_alpha 100
scoreboard players set #base circle_bold 32

scoreboard objectives add circle_radius dummy
scoreboard objectives add circle_alpha dummy
scoreboard objectives add circle_bold dummy
scoreboard objectives add circle_color dummy

scoreboard players set #globle circle_radius 50
scoreboard players set #globle circle_alpha 100
scoreboard players set #globle circle_bold 5
scoreboard players set #globle circle_color 2

function circle_animation:init