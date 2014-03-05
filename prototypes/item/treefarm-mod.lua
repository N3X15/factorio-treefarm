data:extend(
{
	{
		type = "item",
		name = "charcoal",
		icon = "__Treefarm-Mod__/graphics/icons/charcoal.png",
		flags = {"goes-to-main-inventory"},
		fuel_value = "6MJ",
		subgroup = "raw-material",
		order = "b[charcoal]",
		stack_size = 64
	},  

	{
		type = "item",
		name = "coke-coal",
		icon = "__Treefarm-Mod__/graphics/icons/coke-coal.png",
		flags = {"goes-to-main-inventory"},
		fuel_value = "10MJ",
		subgroup = "raw-material",
		order = "b[coke-coal]",
		stack_size = 64
	},

	{
		type = "item",
		name = "ash",
		icon = "__Treefarm-Mod__/graphics/icons/ash.png",
		flags = {"goes-to-main-inventory"},
		subgroup = "raw-material",
		order = "b[ash]",
		stack_size = 128
	},

	{
		type = "item",
		name = "seeds",
		icon = "__Treefarm-Mod__/graphics/icons/seeds.png",
		flags = {"goes-to-main-inventory"},
		subgroup = "raw-material",
		order = "b[seeds]",
		place_result = "germling",
		stack_size = 32
	},

	{
		type = "item",
		name = "crushed-stone",
		icon = "__Treefarm-Mod__/graphics/icons/crushed-stone.png",
		flags = {"goes-to-main-inventory"},
		subgroup = "raw-material",
		order = "b[crushed-stone]",
		stack_size = 128
	},

	{
		type = "item",
		name = "phosphate",
		icon = "__Treefarm-Mod__/graphics/icons/phosphate.png",
		flags = {"goes-to-main-inventory"},
		subgroup = "intermediate-product",
		order = "b[phosphate]",
		stack_size = 64
	},

	{
		type = "item",
		name = "potassium",
		icon = "__Treefarm-Mod__/graphics/icons/potassium.png",
		flags = {"goes-to-main-inventory"},
		subgroup = "intermediate-product",
		order = "b[potassium]",
		stack_size = 64
	},

	{
		type = "item",
		name = "fertilizer",
		icon = "__Treefarm-Mod__/graphics/icons/fertilizer.png",
		flags = {"goes-to-main-inventory"},
		subgroup = "tool",
		order = "b[fertilizer]",
		stack_size = 100
	},

	{
		type = "item",
		name = "liquid-nitrogen-barrel",
		icon = "__Treefarm-Mod__/graphics/icons/liquid-nitrogen-barrel.png",
		flags = {"goes-to-main-inventory"},
		subgroup = "barrel",
		order = "b[liquid-nitrogen-barrel]",
		stack_size = 8
	},

	{
		type = "item",
		name = "cellulose",
		icon = "__Treefarm-Mod__/graphics/icons/cellulose.png",
		flags = {"goes-to-main-inventory"},
		subgroup = "intermediate-product",
		order = "b[cellulose]",
		stack_size = 256
	},

	{
		type = "item",
		name = "nutrients",
		icon = "__Treefarm-Mod__/graphics/icons/nutrients.png",
		flags = {"goes-to-main-inventory"},
		subgroup = "intermediate-product",
		order = "b[nutrients]",
		stack_size = 64
	},

	{
		type = "capsule",
		name = "medicine",
		icon = "__Treefarm-Mod__/graphics/icons/medicine.png",
		flags = {"goes-to-main-inventory"},
		subgroup = "tool",
		order = "b[medicine]",
		stack_size = 8,
		capsule_action =
		{
			type = "use-on-self",
			attack_parameters =
			{
				ammo_category = "capsule",
				cooldown = 30,
				range = 0,
				ammo_type =
				{
					category = "capsule",
					target_type = "position",
					action =
					{
						type = "direct",
						action_delivery =
						{
							type = "instant",
							target_effects = 
							{
								type = "damage",
								damage = {type = "physical", amount = -50}
							}
						}
					}
				}
			}
		}
	},




	{
		type = "item",
		name = "field",
		icon = "__Treefarm-Mod__/graphics/icons/field.png",
		flags = {"goes-to-quickbar"},
		subgroup = "production-machine",
		order = "a[field]",
		place_result = "field",
		stack_size = 8
	},

	{
		type = "item",
		name = "cokery",
		icon = "__Treefarm-Mod__/graphics/icons/cokery.png",
		flags = {"goes-to-quickbar"},
		subgroup = "production-machine",
		order = "a[cokery]",
		place_result = "cokery",
		stack_size = 8
	},

	{
		type = "item",
		name = "stone-crusher",
		icon = "__Treefarm-Mod__/graphics/icons/stone-crusher.png",
		flags = {"goes-to-quickbar"},
		subgroup = "production-machine",
		order = "a[stone-crusher]",
		place_result = "stone-crusher",
		stack_size = 8
	},

	{
		type = "item",
		name = "hydroculture",
		icon = "__Treefarm-Mod__/graphics/icons/hydroculture.png",
		flags = {"goes-to-quickbar"},
		subgroup = "production-machine",
		order = "a[hydroculture]",
		place_result = "hydroculture",
		stack_size = 8
	},


	{
		type = "fluid",
		name = "liquid-air",
		default_temperature = -190,
		heat_capacity = "1KJ",
		base_color = {r=0, g=0, b=0},
		flow_color = {r=0.5, g=1.0, b=1.0},
		max_temperature = -186,
		icon = "__Treefarm-Mod__/graphics/icons/liquid-air.png",
		pressure_to_speed_ratio = 0.4,
		flow_to_energy_ratio = 0.59,
		order = "a[fluid]-b[liquid-air]"
	},

	{
		type = "fluid",
		name = "liquid-nitrogen",
		default_temperature = -200,
		heat_capacity = "1KJ",
		base_color = {r=0, g=0, b=0},
		flow_color = {r=0.5, g=1.0, b=1.0},
		max_temperature = -196,
		icon = "__Treefarm-Mod__/graphics/icons/liquid-nitrogen.png",
		pressure_to_speed_ratio = 0.4,
		flow_to_energy_ratio = 0.59,
		order = "a[fluid]-b[liquid-nitrogen]"
	},

	{
		type = "fluid",
		name = "biomass",
		default_temperature = 25,
		heat_capacity = "1KJ",
		base_color = {r=0, g=0, b=0},
		flow_color = {r=0.1, g=1.0, b=0.0},
		max_temperature = 50,
		icon = "__Treefarm-Mod__/graphics/icons/biomass.png",
		pressure_to_speed_ratio = 0.4,
		flow_to_energy_ratio = 0.59,
		order = "a[fluid]-b[biomass]"
	}
}
)