scoreboard players operation #temp value = #raycast_range value
execute if score #temp value matches 1.. at @s anchored eyes positioned ^ ^ ^ run function circle_animation:use/raycast

#execute at @s run playsound ui.button.click player @s ~ ~ ~ 1 1 1
scoreboard players set @s click 0