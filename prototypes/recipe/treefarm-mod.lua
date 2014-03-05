data:extend(
{
	-- TREEGROWING-RECIPIES --
	-- FIELD --
	{
		type = "recipe",
		name = "field",
		ingredients = {{"stone",20},{"wooden-chest",1},{"burner-inserter",1}},
		result = "field",
		result_count = 1
	},
	-- SEED --
	{
		type = "recipe",
		name = "seeds",
		ingredients = {{"raw-wood",1}},
		result = "seeds",
		result_count = 1
	},

	-- COKERY-RECIPIES --
	-- COKERY --
	{
		type = "recipe",
		name = "cokery",
		ingredients = {{"stone-furnace",1},{"steel-plate",10}},
		result = "cokery",
		result_count = 1,
		enabled = "false",
	},
	-- CHARCOAL --
	{
		type = "recipe",
		name = "charcoal",
		category = "treefarm-mod-smelting",
		energy_required = 18,
		ingredients = {{"raw-wood",10}},
		result = "charcoal",
		result_count = 10,
		enabled = "false"
	},
	-- COAL --
	{
		type = "recipe",
		name = "coal",
		category = "treefarm-mod-smelting",
		energy_required = 18,
		ingredients = {{"charcoal",10}},
		result = "coal",
		result_count = 10,
		enabled = "false"
	},
	-- COKE-COAL --
	{
		type = "recipe",
		name = "coke-coal",
		category = "treefarm-mod-smelting",
		energy_required = 18,
		ingredients = {{"coal",10}},
		result = "coke-coal",
		result_count = 10,
		enabled = "false"
	},
	-- ASH --
	{
		type = "recipe",
		name = "ash",
		category = "treefarm-mod-smelting",
		energy_required = 10,
		ingredients = {{"raw-wood",5}},
		result = "ash",
		result_count = 5,
		enabled = "false"
	},   

	-- STONE-CRUSHER-RECIPIES --
	-- STONE-CRUSHER --
	{
		type = "recipe",
		name = "stone-crusher",
		ingredients = {{"iron-plate",10},{"steel-plate",10},{"copper-cable",5},{"iron-gear-wheel",5}},
		result = "stone-crusher",
		enabled = "false",
		result_count = 1
	},
	-- CRUSHED-STONE --
	{
		type = "recipe",
		name = "crushed-stone",
		category = "treefarm-mod-crushing",
		energy_required = 10,
		ingredients = {{"stone",1}},
		result = "crushed-stone",
		result_count = 2,
		enabled = "false"
	},

	-- CHEMICAL-RECIPIES --
	-- LIQUID-AIR --
	{
		type = "recipe",
		name = "liquid-air",
		category = "chemistry",
		energy_required = 10,
		ingredients ={},
		results=
		{
			{type="fluid", name="liquid-air", amount=1}
		},
		enabled = "false"
	},
	-- LIQUID-NITROGEN --
	{
		type = "recipe",
		name = "liquid-nitrogen",
		category = "chemistry",
		energy_required = 10,
		ingredients ={{type="fluid", name="liquid-air", amount=2}},
		results=
		{
			{type="fluid", name="liquid-nitrogen", amount=1}
		},
		enabled = "false"
	},
	-- FILL NITROGEN-BARREL --
	{
		type = "recipe",
		name = "fill-liquid-nitrogen-barrel",
		category = "chemistry",
		energy_required = 1,
		subgroup = "barrel",
		order = "b[fill-liquid-nitrogen-barrel]",
		icon = "__Treefarm-Mod__/graphics/icons/fill-liquid-nitrogen-barrel.png",
		ingredients =
		{
		  {type="fluid", name="liquid-nitrogen", amount=25},
		  {type="item", name="empty-barrel", amount=1},
		},
		results=
		{
			{type="item", name="liquid-nitrogen-barrel", amount=1}
		},
		enabled = "false"
	},
	-- EMPTY NITROGEN-BARREL --
	{
		type = "recipe",
		name = "empty-liquid-nitrogen-barrel",
		category = "chemistry",
		energy_required = 1,
		subgroup = "barrel",
		order = "c[empty-liquid-nitrogen-barrel]",
		icon = "__Treefarm-Mod__/graphics/icons/empty-liquid-nitrogen-barrel.png",
		ingredients =
		{
		  {type="item", name="liquid-nitrogen-barrel", amount=1}
		},
		results=
		{
			{type="fluid", name="liquid-nitrogen", amount=25},
			{type="item", name="empty-barrel", amount=1}
		},
		enabled = "false"
	},
	-- PHOSPHATE --
	{
		type = "recipe",
		name = "phosphate",
		category = "chemistry",
		energy_required = 5,
		icon = "__Treefarm-Mod__/graphics/icons/phosphate.png",
		ingredients =
		{
		  {type="item", name="crushed-stone", amount=3},
		  {type="item", name="science-pack-1", amount=1},
		  {type="fluid", name="water", amount=5}
		},
		results=
		{
			{type="item", name="phosphate", amount=1}
		},
		enabled = "false"
	},
	-- POTASSIUM --
	{
		type = "recipe",
		name = "potassium",
		category = "chemistry",
		energy_required = 5,
		icon = "__Treefarm-Mod__/graphics/icons/potassium.png",
		ingredients =
		{
		  {type="item", name="crushed-stone", amount=3},
		  {type="item", name="science-pack-1", amount=1},
		  {type="fluid", name="water", amount=5}
		},
		results=
		{
			{type="item", name="potassium", amount=1}
		},
		enabled = "false"
	},
	-- FERTILIZER SOLID --
	{
		type = "recipe",
		name = "fertilizer1",
		category = "chemistry",
		energy_required = 125,
		icon = "__Treefarm-Mod__/graphics/icons/fertilizer.png",
		ingredients =
		{
			{type="item", name="phosphate", amount=25},
			{type="item", name="potassium", amount=50},
			{type="item", name="liquid-nitrogen-barrel", amount=1},
			{type="item", name="ash", amount=25}
		},
		results=
		{
			{type="item", name="fertilizer", amount=100}
		},
		enabled = "false"
	},
	-- FERTILIZER LIQUID --
	{
		type = "recipe",
		name = "fertilizer2",
		category = "chemistry",
		energy_required = 5,
		icon = "__Treefarm-Mod__/graphics/icons/fertilizer.png",
		ingredients =
		{
			{type="item", name="phosphate", amount=1},
			{type="item", name="potassium", amount=2},
			{type="fluid", name="liquid-nitrogen", amount=1},
			{type="item", name="ash", amount=6}
		},
		results=
		{
			{type="item", name="fertilizer", amount=5}
		},
		enabled = "false"
	},

	-- HYDROCULTURE-RECIPIES --
	-- HYDROCULTURE --
	{
		type = "recipe",
		name = "hydroculture",
		ingredients = {{"iron-plate",20},{"steel-plate",10},{"pipe",30},{"seeds",100}},
		result = "hydroculture",
		enabled = "false",
		result_count = 1
	},

	-- BIOMASS --
	{
		type = "recipe",
		name = "biomass",
		category = "treefarm-mod-hydroculture",
		energy_required = 100,
		ingredients =
		{
			{type="item", name="fertilizer", amount=1},
			{type="fluid", name="water", amount=10}
		},
		results=
		{
			{type="fluid", name="biomass", amount=5}
		},
		enabled = "false"
	},

	-- CELLULOSE --
	{
		type = "recipe",
		name = "cellulose",
		category = "chemistry",
		energy_required = 10,
		ingredients =
		{
			{type="fluid", name="biomass", amount=10}
		},
		results=
		{
			{type="item", name="cellulose", amount=5}
		},
		enabled = "false"
	},

	-- PLASTIC --
	{
		type = "recipe",
		name = "treefarm-mod-platic",
		category = "chemistry",
		energy_required = 2,
		ingredients =
		{
			{type="item", name="cellulose", amount=2}
		},
		results=
		{
			{type="item", name="plastic-bar", amount=1}
		},
		enabled = "false"
	},

	-- NUTRIENTS --
	{
		type = "recipe",
		name = "nutrients",
		category = "chemistry",
		energy_required = 20,
		ingredients =
		{
			{type="fluid", name="biomass", amount=20}
		},
		results=
		{
			{type="item", name="nutrients", amount=1}
		},
		enabled = "false"
	},

	-- MEDICINE --
	{
		type = "recipe",
		name = "medicine",
		category = "crafting",
		energy_required = 20,
		ingredients =
		{
			{type="item", name="nutrients", amount=10}
		},
		results=
		{
			{type="item", name="medicine", amount=1}
		},
		enabled = "false"
	},
}
)