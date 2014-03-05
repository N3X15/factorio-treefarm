pipecoverspictures = function()
  return {
    north =
    {
      filename = "__base__/graphics/entity/pipe-covers/pipe-cover-north.png",
      priority = "extra-high",
      width = 44,
      height = 32
    },
    east =
    {
      filename = "__base__/graphics/entity/pipe-covers/pipe-cover-east.png",
      priority = "extra-high",
      width = 32,
      height = 32
    },
    south =
    {
      filename = "__base__/graphics/entity/pipe-covers/pipe-cover-south.png",
      priority = "extra-high",
      width = 46,
      height = 52
    },
    west =
    {
      filename = "__base__/graphics/entity/pipe-covers/pipe-cover-west.png",
      priority = "extra-high",
      width = 32,
      height = 32
    }
  }
end

data:extend(
{
	{
		type = "smart-container",
		name = "field",
		icon = "__Treefarm-Mod__/graphics/icons/field.png",
		flags = {"placeable-neutral", "player-creation"},
		minable = {mining_time = 1,result = "field"},
		max_health = 1,
		collision_box = {{-0.65,-0.75},{0.40,0.25}},
		selection_box = {{-1.0,-1.0},{8.0,8.0}},
		inventory_size = 3,
		picture = 	{
						filename = "__Treefarm-Mod__/graphics/entity/Treefarm-Mod/field.png",
						priority = "extra-high",
						width = 512,
						height = 512,
						shift = {0.00, -0.25}
					}
	},

	{
		type = "assembling-machine",
		name = "cokery",
		icon = "__Treefarm-Mod__/graphics/icons/cokery.png",
		flags = {"placeable-neutral","placeable-player", "player-creation"},
		minable = {hardness = 0.2,mining_time = 0.5,result = "cokery"},
		max_health = 200,
		corpse = "big-remnants",
		resistances = {{type = "fire",percent = 70}},
		collision_box = {{-1.4, -2.4}, {1.4, 2.4}},
		selection_box = {{-1.5, -2.5}, {1.5, 2.5}},
		module_slots = 2,
		allowed_effects = {"speed"},
		animation =
		{
			north =
			{
				filename = "__Treefarm-Mod__/graphics/entity/Treefarm-Mod/cokery-vertical.png",
				frame_width = 180,
				frame_height = 222,
				frame_count = 32,
				line_length = 8,
				shift = {1.2, 1}
			},
			south =
			{
				filename = "__Treefarm-Mod__/graphics/entity/Treefarm-Mod/cokery-vertical.png",
				frame_width = 180,
				frame_height = 222,
				frame_count = 32,
				line_length = 8,
				shift = {1.2, 1}
			},
			west =
			{
				filename = "__Treefarm-Mod__/graphics/entity/Treefarm-Mod/cokery-vertical.png",
				frame_width = 180,
				frame_height = 222,
				frame_count = 32,
				line_length = 8,
				shift = {1.2, 1}

				--filename = "__Treefarm-Mod__/graphics/entity/Treefarm-Mod/cokery-horizontal.png",
				--frame_width = 219,
				--frame_height = 150,
				--frame_count = 32,
				--line_length = 8,
				--shift = {1.1, -0.3}
			},
			east =
			{
				filename = "__Treefarm-Mod__/graphics/entity/Treefarm-Mod/cokery-vertical.png",
				frame_width = 180,
				frame_height = 222,
				frame_count = 32,
				line_length = 8,
				shift = {1.2, 1}

				--filename = "__Treefarm-Mod__/graphics/entity/Treefarm-Mod/cokery-horizontal.png",
				--frame_width = 219,
				--frame_height = 150,
				--frame_count = 32,
				--line_length = 8,
				--shift = {1.1, -0.3}
			}				
		},
		working_visualisations =
		{
			{
				north_position = { 0.0, -1.0},
				south_position = { 0.0, -1.0},
				west_position  = { 0.0, -1.0},	--{ 0.0, -2.0},
				east_position  = { 0.0, -1.0},	--{ 0.0, -2.0},
			
				animation =
				{
					filename = "__Treefarm-Mod__/graphics/entity/Treefarm-Mod/fire.png",
					frame_count = 29,
					frame_width = 16,
					frame_height = 35,
					scale = 1.5,
					shift = {0, -0.5625},
					run_mode="backward"
				}
			},
			{
				north_position = { 0.0, -2.0},
				south_position = { 0.0, -2.0},
				west_position  = { 0.0, -2.0},	--{-1.3, -2.0},
				east_position  = { 0.0, -2.0},	--{-1.3, -2.0},
			
				animation =
				{
					filename = "__Treefarm-Mod__/graphics/entity/Treefarm-Mod/fire.png",
					frame_count = 29,
					frame_width = 16,
					frame_height = 35,
					scale = 1.5,
					shift = {0, -0.5625},
					run_mode="backward"
				}
			},
			{
				north_position = { 0.0,  0.0},
				south_position = { 0.0,  0.0},
				west_position  = { 0.0,  0.0},	--{ 1.3, -2.0},
				east_position  = { 0.0,  0.0},	--{ 1.3, -2.0},
			
				animation =
				{
					filename = "__Treefarm-Mod__/graphics/entity/Treefarm-Mod/fire.png",
					frame_count = 29,
					frame_width = 16,
					frame_height = 35,
					scale = 1.5,
					shift = {0, -0.5625},
					run_mode="backward"
				}
			}
		},
		crafting_categories = {"treefarm-mod-smelting"},
		energy_source =
		{
			type = "electric",
			input_priority = "secondary",
			usage_priority = "secondary-input",
			emissions = 6 / 3
		},
		energy_usage = "6W",
		crafting_speed = 2,
		ingredient_count = 1
	},

	{
		type = "assembling-machine",
		name = "stone-crusher",
		icon = "__Treefarm-Mod__/graphics/icons/stone-crusher.png",
		flags = {"placeable-neutral","player-creation"},
		minable = {hardness = 0.2,mining_time = 0.5,result = "stone-crusher"},
		max_health = 100,
		resistances = {{type = "fire",percent = 70}},
		collision_box = {{-0.4,-0.4},{0.4,0.4}},
		selection_box = {{-0.5,-0.5},{0.5,0.5}},
		animation = {
						filename = "__Treefarm-Mod__/graphics/entity/Treefarm-Mod/stone-crusher-1.png",
						priority = "medium",
						frame_width = 32,
						frame_height = 42,
						frame_count = 17,
						line_length = 17,
						shift = {0.0, -0.1}
					},
		crafting_categories = {"treefarm-mod-crushing"},
		crafting_speed = 1,
		energy_source = {type = "electric",input_priority = "secondary", usage_priority = "secondary-input", emissions = 0.05 / 1.5},
		energy_usage = "50kW",
		ingredient_count = 1
	},

	{
		type = "assembling-machine",
		name = "hydroculture",
		icon = "__Treefarm-Mod__/graphics/icons/hydroculture.png",
		flags = {"placeable-neutral","player-creation"},
		minable = {hardness = 0.2,mining_time = 0.5,result = "hydroculture"},
		max_health = 200,
		resistances = {{type = "fire",percent = 70}},
		collision_box = {{-7.9, -7.9}, {7.9, 7.9}},
		selection_box = {{-8.0, -8.0}, {8.0, 8.0}},
		animation =
		{
			north =
			{
				filename = "__Treefarm-Mod__/graphics/entity/Treefarm-Mod/hydroculture-vert.png",
						priority = "medium",
						frame_width = 512,
						frame_height = 512,
						frame_count = 1,
						shift = {0.0, 0.0}
			},
			south =
			{
				filename = "__Treefarm-Mod__/graphics/entity/Treefarm-Mod/hydroculture-vert.png",
						priority = "medium",
						frame_width = 512,
						frame_height = 512,
						frame_count = 1,
						shift = {0.0, 0.0}
			},
			west =
			{
				filename = "__Treefarm-Mod__/graphics/entity/Treefarm-Mod/hydroculture-horz.png",
						priority = "medium",
						frame_width = 512,
						frame_height = 512,
						frame_count = 1,
						shift = {0.0, 0.0}
			},
			east =
			{
				filename = "__Treefarm-Mod__/graphics/entity/Treefarm-Mod/hydroculture-horz.png",
						priority = "medium",
						frame_width = 512,
						frame_height = 512,
						frame_count = 1,
						shift = {0.0, 0.0}
			}				
		},
		crafting_categories = {"treefarm-mod-hydroculture"},
		crafting_speed = 1,
		energy_source = {type = "electric",input_priority = "secondary", usage_priority = "secondary-input", emissions = -0.001 / 1.5},
		energy_usage = "100kW",
		ingredient_count = 2,
		fluid_boxes =
		{
			{
				production_type = "input",
				pipe_covers = pipecoverspictures(),
				base_area = 10,
				base_level = -1,
				pipe_connections = {{ type="input", position = {-3.5, 8.5} }}
			},
			{
				production_type = "input",
				pipe_covers = pipecoverspictures(),
				base_area = 10,
				base_level = -1,
				pipe_connections = {{ type="input", position = {3.5, 8.5} }}
			},
			{
				production_type = "output",
				pipe_covers = pipecoverspictures(),
				base_level = 1,
				pipe_connections = {{ position = {-3.5, -8.5} }}
			},
			{
				production_type = "output",
				pipe_covers = pipecoverspictures(),
				base_level = 1,
				pipe_connections = {{ position = {3.5, -8.5} }}
			}
		}
	},

	{
		type = "tree",
		name = "germling",
		icon = "__Treefarm-Mod__/graphics/icons/seeds.png",
		flags = {"placeable-neutral", "breaths-air"},
		emissions_per_tick = -0.0001,
		minable =
		{
			count = 1,
			mining_particle = "wooden-particle",
			mining_time = 0.1,
			result = "seeds"
		},
		max_health = 10,
		collision_box = {{-0.01, -0.01}, {0.01, 0.01}},
		selection_box = {{-0.1, -0.1}, {0.1, 0.1}},
		drawing_box = {{0.0, 0.0}, {1.0, 1.0}},
		pictures =
		{
			{
				filename = "__Treefarm-Mod__/graphics/entity/Treefarm-Mod/germling.png",
				priority = "extra-high",
				width = 32,
				height = 32,
				shift = {0.0, 0.0}
			}
		}
	},

	{
		type = "tree",
		name = "very-small-tree",
		order="b-b-g",
		icon = "__Treefarm-Mod__/graphics/entity/Treefarm-Mod/grass.png",
		flags = {"placeable-neutral", "placeable-off-grid", "breaths-air"},
		emissions_per_tick = -0.0002,
		minable =
		{
			count = 1,
			mining_particle = "wooden-particle",
			mining_time = 0.2,
			result = "raw-wood"
		},
		max_health = 20,
		collision_box = {{-0.2, -0.2}, {0.2, 0.2}},
		selection_box = {{-0.2, -0.55}, {0.2, 0.2}},
		drawing_box = {{-0.2, -0.7}, {0.2, 0.2}},
		pictures =
		{
			{
				filename = "__Treefarm-Mod__/graphics/entity/Treefarm-Mod/very-small-tree-01.png",
				priority = "extra-high",
				width = math.floor(155/4),
				height = math.floor(118/4),
				shift = {1.1/4, -1/4}
			},
			{
				filename = "__Treefarm-Mod__/graphics/entity/Treefarm-Mod/very-small-tree-02.png",
				priority = "extra-high",
				width = math.floor(144/4),
				height = math.floor(169/4),
				shift = {1.2/4, -0.8/4}
			},
			{
				filename = "__Treefarm-Mod__/graphics/entity/Treefarm-Mod/very-small-tree-03.png",
				priority = "extra-high",
				width = math.floor(151/4),
				height = math.floor(131/4),
				shift = {0.8/4, -0.7/4}
			},
			{
				filename = "__Treefarm-Mod__/graphics/entity/Treefarm-Mod/very-small-tree-04.png",
				priority = "extra-high",
				width = math.floor(167/4),
				height = math.floor(131/4),
				shift = {2/4, -1/4}
			},
			{
				filename = "__Treefarm-Mod__/graphics/entity/Treefarm-Mod/very-small-tree-05.png",
				priority = "extra-high",
				width = math.floor(156/4),
				height = math.floor(154/4),
				shift = {1.5/4, -1.7/4}
			},
			{
				filename = "__Treefarm-Mod__/graphics/entity/Treefarm-Mod/very-small-tree-06.png",
				priority = "extra-high",
				width = math.floor(113/4),
				height = math.floor(111/4),
				shift = {0.7/4, -0.9/4}
			}
		} 
	},

	{
		type = "tree",
		name = "small-tree",
		order="b-b-g",
		icon = "__Treefarm-Mod__/graphics/entity/Treefarm-Mod/grass.png",
		flags = {"placeable-neutral", "placeable-off-grid", "breaths-air"},
		emissions_per_tick = -0.0003,
		minable =
		{
			count = 2,
			mining_particle = "wooden-particle",
			mining_time = 0.5,
			result = "raw-wood"
		},
		max_health = 50/2,
		collision_box = {{-0.7/2, -0.8/2}, {0.7/2, 0.8/2}},
		selection_box = {{-0.8/2, -2.2/2}, {0.8/2, 0.8/2}},
		drawing_box = {{-0.8/2, -2.8/2}, {0.8/2, 0.8/2}},
		pictures =
		{
			{
				filename = "__Treefarm-Mod__/graphics/entity/Treefarm-Mod/small-tree-01.png",
				priority = "extra-high",
				width = math.floor(155/2),
				height = math.floor(118/2),
				shift = {1.1/2, -1/2}
			},
			{
				filename = "__Treefarm-Mod__/graphics/entity/Treefarm-Mod/small-tree-02.png",
				priority = "extra-high",
				width = math.floor(144/2),
				height = math.floor(169/2),
				shift = {1.2/2, -0.8/2}
			},
			{
				filename = "__Treefarm-Mod__/graphics/entity/Treefarm-Mod/small-tree-03.png",
				priority = "extra-high",
				width = math.floor(151/2),
				height = math.floor(131/2),
				shift = {0.8/2, -0.7/2}
			},
			{
				filename = "__Treefarm-Mod__/graphics/entity/Treefarm-Mod/small-tree-04.png",
				priority = "extra-high",
				width = math.floor(167/2),
				height = math.floor(131/2),
				shift = {2/2, -1/2}
			},
			{
				filename = "__Treefarm-Mod__/graphics/entity/Treefarm-Mod/small-tree-05.png",
				priority = "extra-high",
				width = math.floor(156/2),
				height = math.floor(154/2),
				shift = {1.5/2, -1.7/2}
			},
			{
				filename = "__Treefarm-Mod__/graphics/entity/Treefarm-Mod/small-tree-06.png",
				priority = "extra-high",
				width = math.floor(113/2),
				height = math.floor(111/2),
				shift = {0.7/2, -0.9/2}
			}
		}
	},

	{
		type = "tree",
		name = "medium-tree",
		order="b-b-g",
		icon = "__Treefarm-Mod__/graphics/entity/Treefarm-Mod/grass.png",
		flags = {"placeable-neutral", "placeable-off-grid", "breaths-air"},
		emissions_per_tick = -0.0004,
		minable =
		{
			count = 3,
			mining_particle = "wooden-particle",
			mining_time = 1.0,
			result = "raw-wood"
		},
		max_health = math.floor(50*0.75),
		collision_box = {{-0.7*0.75, -0.8*0.75}, {0.7*0.75, 0.8*0.75}},
		selection_box = {{-0.8*0.75, -2.2*0.75}, {0.8*0.75, 0.8*0.75}},
		drawing_box = {{-0.8*0.75, -2.8*0.75}, {0.8*0.75, 0.8*0.75}},
		pictures =
		{
			{
				filename = "__Treefarm-Mod__/graphics/entity/Treefarm-Mod/medium-tree-01.png",
				priority = "extra-high",
				width = math.floor(155*0.75),
				height = math.floor(118*0.75),
				shift = {1.1*0.75, -1*0.75}
			},
			{
				filename = "__Treefarm-Mod__/graphics/entity/Treefarm-Mod/medium-tree-02.png",
				priority = "extra-high",
				width = math.floor(144*0.75),
				height = math.floor(169*0.75),
				shift = {1.2*0.75, -0.8*0.75}
			},
			{
				filename = "__Treefarm-Mod__/graphics/entity/Treefarm-Mod/medium-tree-03.png",
				priority = "extra-high",
				width = math.floor(151*0.75),
				height = math.floor(131*0.75),
				shift = {0.8*0.75, -0.7*0.75}
			},
			{
				filename = "__Treefarm-Mod__/graphics/entity/Treefarm-Mod/medium-tree-04.png",
				priority = "extra-high",
				width = math.floor(167*0.75),
				height = math.floor(131*0.75),
				shift = {2*0.75, -1*0.75}
			},
			{
				filename = "__Treefarm-Mod__/graphics/entity/Treefarm-Mod/medium-tree-05.png",
				priority = "extra-high",
				width = math.floor(156*0.75),
				height = math.floor(154*0.75),
				shift = {1.5*0.75, -1.7*0.75}
			},
			{
				filename = "__Treefarm-Mod__/graphics/entity/Treefarm-Mod/medium-tree-06.png",
				priority = "extra-high",
				width = math.floor(113*0.75),
				height = math.floor(111*0.75),
				shift = {0.7*0.75, -0.9*0.75}
			}
		}
	}
}
)