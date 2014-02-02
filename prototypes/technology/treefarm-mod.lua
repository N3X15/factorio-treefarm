data:extend(
{
  {
    type = "technology",
    name = "fertilizer",
    icon = "__Treefarm-Mod__/graphics/icons/fertilizer.png",
    effects = {
      {
        type = "unlock-recipe",
        recipe = "chemical-lab"
      },
      {
        type = "unlock-recipe",
        recipe = "stone-crusher"
      }
    },
    prerequisites = {
      "advanced-chemistry"
    },
    unit = {
      count = 75,
      ingredients = {
        {"science-pack-1", 1},
        {"science-pack-2", 1}
      },
      time = 10
    }
  },

}
)