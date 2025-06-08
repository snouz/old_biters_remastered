local old_control_name = "old-enemy-base"

local function old_enemy_autoplace(params)
  return
  {
    control = params.control or old_control_name,
    order = params.order or "b[enemy]-misc",
    force = "enemy",
    probability_expression = params.probability_expression,
    richness_expression = 1,
  }
end

local function old_enemy_spawner_autoplace(probability_expression)
  return old_enemy_autoplace{
    probability_expression = probability_expression, --"min(" .. probability_expression .. ",range_select{input=moisture,from=0,to=0.49,slope=0.05,min=0,max=1})",
    order = "b[enemy]-ca[old_spawner]",
  }
end

local function old_enemy_worm_autoplace(probability_expression)
  return old_enemy_autoplace{
    --probability_expression = "(min(" .. probability_expression .. "),range_select{input=moisture,from=0,to=0.49,slope=0.05,min=0,max=1})) * (1 - no_enemies_mode)",
    probability_expression = probability_expression .. "* (1 - no_enemies_mode)", --"(min(" .. probability_expression .. ",range_select{input=moisture,from=0,to=0.49,slope=0.05,min=0,max=1})) * (1 - no_enemies_mode)",
    order = "b[enemy]-cb[old_worm]",
  }
end

return
{
  control_name = old_control_name,
  old_enemy_autoplace = old_enemy_autoplace,
  old_enemy_spawner_autoplace = old_enemy_spawner_autoplace,
  old_enemy_worm_autoplace = old_enemy_worm_autoplace
}
