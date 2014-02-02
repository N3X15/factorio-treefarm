data:extend(
{
    {
        type = "recipe",
        name = "field",
        ingredients = {{"stone",20},{"wooden-chest",1},{"burner-inserter",1}},
        result = "field",
        result_count = 1
    },

    {
        type = "recipe",
        name = "cokery",
        ingredients = {{"stone-furnace",1},{"iron-plate",10}},
        result = "cokery",
        result_count = 1
    },    

    {
        type = "recipe",
        name = "stone-crusher",
        ingredients = {{"iron-plate",10},{"steel-plate",10},{"copper-cable",5},{"iron-gear-wheel",5}},
        result = "stone-crusher",
        enabled = "false",
        result_count = 1
    },

    {
        type = "recipe",
        name = "chemical-lab",
        ingredients = {{"iron-plate",10},{"copper-plate",10},{"electronic-circuit",40},{"iron-gear-wheel",20}},
        result = "chemical-lab",
        enabled = "false",
        result_count = 1
    },

    {
        type = "recipe",
        name = "charcoal",
        category = "treefarm-mod-smelting",
        energy_required = 18,
        ingredients = {{"raw-wood",10}},
        result = "charcoal",
        result_count = 10
    },

    {
        type = "recipe",
        name = "coal",
        category = "treefarm-mod-smelting",
        energy_required = 18,
        ingredients = {{"charcoal",10}},
        result = "coal",
        result_count = 10
    },

    {
        type = "recipe",
        name = "coke-coal",
        category = "treefarm-mod-smelting",
        energy_required = 18,
        ingredients = {{"coal",10}},
        result = "coke-coal",
        result_count = 10
    },

    {
        type = "recipe",
        name = "ash",
        category = "treefarm-mod-smelting",
        energy_required = 10,
        ingredients = {{"raw-wood",5}},
        result = "ash",
        result_count = 5
    },

    {
        type = "recipe",
        name = "seeds",
        ingredients = {{"raw-wood",1}},
        result = "seeds",
        result_count = 1
    },

    {
        type = "recipe",
        name = "crushed-stone",
        category = "treefarm-mod-crushing",
        energy_required = 10,
        ingredients = {{"stone",1}},
        result = "crushed-stone",
        result_count = 2
    },

    {
        type = "recipe",
        name = "liquid-air",
        category = "treefarm-mod-chemistry",
        energy_required = 10,
        ingredients = {{"iron-plate",1}},
        result = "liquid-air",
        result_count = 3
    },

    {
        type = "recipe",
        name = "liquid-nitrogen",
        category = "treefarm-mod-chemistry",
        energy_required = 10,
        ingredients = {{"iron-plate",1},{"liquid-air",6}},
        result = "liquid-nitrogen",
        result_count = 3
    },

    {
        type = "recipe",
        name = "phosphate",
        category = "treefarm-mod-chemistry",
        energy_required = 5,
        ingredients = {{"crushed-stone",3},{"science-pack-1",1}},
        result = "phosphate",
        result_count = 1
    },

    {
        type = "recipe",
        name = "potassium",
        category = "treefarm-mod-chemistry",
        energy_required = 5,
        ingredients = {{"crushed-stone",3},{"science-pack-1",1}},
        result = "potassium",
        result_count = 1
    },

    {
        type = "recipe",
        name = "fertilizer",
        category = "treefarm-mod-chemistry",
        energy_required = 10,
        ingredients = {{"liquid-nitrogen",1},{"phosphate",1},{"potassium",2},{"ash",6}},
        result = "fertilizer",
        result_count = 5
    }
}
)