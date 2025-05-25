local item_sounds = require("__base__.prototypes.item_sounds")

local artifact = {
  type = "item",
  name = "alien-artifact",
  icon = modgraphics .. "icons/alien-artifact.png",
  icon_size = 64,
  subgroup = "raw-material",
  order = "zzz[alien-artifact]",
  inventory_move_sound = item_sounds.resource_inventory_move,
  pick_sound = item_sounds.resource_inventory_pickup,
  drop_sound = item_sounds.resource_inventory_move,
  hidden = true,
  stack_size = 500,
  weight = 2*kg,
  default_request_amount = 10
}

--if not mods["SchallAlienLoot"] then
--  artifact.hidden = true
--end

data:extend({artifact})