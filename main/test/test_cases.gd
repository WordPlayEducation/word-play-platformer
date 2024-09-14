extends Node


func retrieve() -> Array:
	return [
		{
			"type" = "fluid",
			"text" = "water",
			"color" = "#192841",
			"sub_color" = "#203354",
		},
		{
			"type" = "inanimate_solid", 
			"text" = "stone",
			"physics_type" = "mobile",
			"color" = "#bbbbbb"
		},
		{
			"type" = "life",
			"text" = "monkey",
			"color" = "#765341", 
			"sub_color" = "#8b6c5c",
			"movement_type" = "land"
		},
		{
			"type" = "inanimate_solid",
			"text" = "barrel",
			"physics_type" = "rigid",
			"color" = "#3d251e",
			"sub_color" = "#4c3228"
		},
	]
