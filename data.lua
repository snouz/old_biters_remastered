modgraphics = "__old_biters_remastered__/graphics/"

require ("__base__.prototypes.entity.enemy-constants")
require ("__base__.prototypes.entity.enemy-projectiles")

--require ("__base__.prototypes.entity.biter-animations")
--require ("__base__.prototypes.entity.spitter-animations")
--require ("__base__.prototypes.entity.spawner-animation")
--require ("__base__.prototypes.entity.worm-animations")

require ("prototypes.old-biter-animations")
require ("prototypes.old-spitter-animations")
require ("prototypes.old-worm-animations")
require ("prototypes.old-spawner-animation")

local biter_ai_settings = require ("__base__.prototypes.entity.biter-ai-settings")
local enemy_autoplace = require ("__base__.prototypes.entity.enemy-autoplace-utils")
local sounds = require ("__base__.prototypes.entity.sounds")
local hit_effects = require ("__base__.prototypes.entity.hit-effects")
local simulations = require("__base__.prototypes.factoriopedia-simulations")

--local old_biter_spawner_tint = {r=1.0, g=1.0, b=1.0, a=1/2}
--local old_spitter_spawner_tint = {r=0.99, g=0.09, b=0.09, a=1/2}
--local old_biter_spawner_tint = {0.92, 0.54, 0, 0.5}
--local old_spitter_spawner_tint = {0.99, 0.09, 0.09, 1}


local old_biter_spawner_tint = {0.7, 0.4, 0.2, 0.5} --unused, naked
local old_spitter_spawner_tint = {122/2,72/2,30, 180}--{93,58,65, 0.4}--{0.3, 0.1, 0.1, 0.7}

local old_small_worm_scale = 0.325
local old_medium_worm_scale = 0.415
local old_big_worm_scale = 0.5
local old_behemoth_worm_scale = 0.6

--local old_small_worm_tint = {r=0.9, g=0.15, b=0.3, a=1.0/2}
--local old_medium_worm_tint = {r=0.9, g=0.15, b=0.3, a=1.0/2}
--local old_big_worm_tint = {r=0.34, g=0.68, b=0.90, a=1.0/2}
--local old_behemoth_worm_tint = {r=0.88, g=0.24, b=0.24, a=0.9/2}
local old_small_worm_tint = {0.7, 1, 0.3, 0.4}
local old_medium_worm_tint = {0.9, 0.15, 0.3, 0.9}
local old_big_worm_tint = {0.34, 0.68, 0.90, 0.7}
local old_behemoth_worm_tint = {0.25, 0.8, 0, 0.6}

local old_small_biter_scale = 0.25
local old_medium_biter_scale = 0.35
local old_big_biter_scale = 0.5
local old_behemoth_biter_scale = 0.6

--local old_small_biter_tint1 = {r=0.56, g=0.46, b=0.42, a=0.65/2}
--local old_small_biter_tint2 = {r=1, g=0.63, b=0, a=0.4/2}
--local old_medium_biter_tint1 = {r=0.78, g=0.15, b=0.15, a=0.6/2}
--local old_medium_biter_tint2 = {r=0.9, g=0.3, b=0.3, a=0.75/2}
--local old_big_biter_tint1 = {r=0.34, g=0.68, b=0.90, a=0.6/2}
--local old_big_biter_tint2 = {r=0.31, g=0.61, b=0.95, a=0.85/2}
--local old_behemoth_biter_tint1 = {r=0.3, g=0.9, b=0.3, a=0.75/2}
--local old_behemoth_biter_tint2 = {r=0.88, g=0.24, b=0.24, a=0.9/2}
local old_small_biter_tint1 = {0.5, 0.5, 0.5, 0.5}--{0.70, 0.68, 0.61, 0.5}
local old_small_biter_tint2 = {0.62, 0.55, 0.2, 0.8}
local old_medium_biter_tint1 = {0.59, 0.56, 0.61, 0.5}
local old_medium_biter_tint2 = {0.6, 0.36, 0.36, 0.8}
local old_big_biter_tint1 = {0.47, 0.50, 0.82, 0.5}
local old_big_biter_tint2 = {0.15, 0.55, 0.5, 0.8}
local old_behemoth_biter_tint1 = {0.3, 0.35, 0.3, 0.5}
local old_behemoth_biter_tint2 = {0.45, 0.82, 0.1, 0.8}

local old_small_spitter_scale = 0.25
local old_medium_spitter_scale = 0.35
local old_big_spitter_scale = 0.5
local old_behemoth_spitter_scale = 0.6

--local old_small_spitter_tint = {r=0.68, g=0.4, b=0, a=1/2}
--local old_medium_spitter_tint = {r=0.83, g=0.39, b=0.36, a=0.75/2}
--local old_big_spitter_tint = {r=0.54, g=0.58, b=0.85, a=0.6/2}
--local old_behemoth_spitter_tint = {r=0.3, g=0.9, b=0.3, a=0.75/2}
local old_small_spitter_tint = {0.6, 0.35, 0, 0.5}
local old_medium_spitter_tint = {0.7, 0.2, 0.3, 0.7}
local old_big_spitter_tint = {0.1, 0.4, 0.6, 0.8}
local old_behemoth_spitter_tint = {0.3, 0.4, 0.06, 1}





function old_shift_medium_worm(shiftx, shifty)
  return {shiftx - 0.15, shifty + 0.15}
end

function old_shift_big_worm(shiftx, shifty)
  return {shiftx - 0.2, shifty + 0.2}
end

local end_attack_speed_multiplier_when_killed = 2
local start_attack_speed_multiplier_when_killed = 2
local prepared_alternative_speed_multiplier_when_killed = 2
local folding_speed_multiplier_when_killed = 2
local preparing_speed_multiplier_when_killed = 2

local end_attack_starting_progress_when_killed = 13 / 22 -- first 13-14 frames are just a two frame loop during which the worm vomits the acid, so we can skip it
local prepared_starting_progress_when_killed = (71-15) / 71


local make_unit_melee_ammo_type = function(damage_value)
  return
  {
    target_type = "entity",
    action =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          type = "damage",
          damage = { amount = damage_value , type = "physical"}
        }
      }
    }
  }
end



local function old_worm_corpse(name, scale, tint, order_char)
  local tab = {}
  order_char = order_char or "a"

  tab.type = "corpse"
  tab.name = name .. "-worm-corpse"
  tab.icon = modgraphics .. "/icons/" .. name .. "-worm-corpse.png"
  tab.selection_box = {{-0.8, -0.8}, {0.8, 0.8}}
  tab.selectable_in_game = false
  tab.dying_speed = 0.01
  tab.time_before_removed = 15 * 60 * 60
  tab.subgroup = "corpses"
  tab.order = "c[corpse]-c[worm]-".. order_char .."[" .. name .. "]"
  tab.flags = {"placeable-neutral", "placeable-off-grid", "building-direction-8-way", "not-repairable", "not-on-map"}
  tab.hidden_in_factoriopedia = true
  tab.final_render_layer = "lower-object-above-shadow"
  tab.animation = old_worm_die_animation(scale, tint)
  --tab.decay_animation = worm_decay_animation(scale, tint)
  --tab.decay_frame_transition_duration = 6 * 60
  --[[tab.ground_patch =
  {
    sheet = worm_integration(scale)
  }
  tab.ground_patch_decay =
  {
    sheet = worm_integration_decay(scale)
  }]]

  return tab
end

local function old_worm_corpse_burrowed(name, scale, tint, order_char)
  local tab = old_worm_corpse(name, scale, tint, order_char)

  tab.name = tab.name .. "-burrowed"
  tab.order = tab.order .. "-burrowed"
  tab.animation = old_worm_die_animation(scale, tint)

  return tab
end




local function old_spitter_attack_parameters(data)
  return
  {
    type = "stream",
    ammo_category = "biological",
    cooldown = data.cooldown,
    cooldown_deviation = data.cooldown_deviation,
    range = data.range,
    range_mode = data.range_mode,
    min_attack_distance = data.min_attack_distance,
    --projectile_creation_distance = 1.9,
    damage_modifier = data.damage_modifier,
    warmup = 30,
    projectile_creation_parameters = spitter_shoot_shiftings(data.scale, data.scale * scale_spitter_stream),
    use_shooter_direction = true,

    lead_target_for_projectile_speed = 0.2* 0.75 * 1.5 *1.5, -- this is same as particle horizontal speed of flamethrower fire stream

    ammo_type =
    {
      action =
      {
        type = "direct",
        action_delivery =
        {
          type = "stream",
          stream = data.acid_stream_name
        }
      }
    },
    cyclic_sound =
    {
      begin_sound =
      {
        category = "enemy",
        variations = sound_variations("__base__/sound/creatures/spitter-spit-start", 4, 0.27),
        aggregation = { max_count = 1, remove = true, count_already_playing = true}
      }
    },
    animation = old_spitterattackanimation(data.scale, data.tint1)
  }
end

local function old_spitter_mid_attack_parameters(data)
  return
  {
    type = "stream",
    ammo_category = "biological",
    cooldown = data.cooldown,
    cooldown_deviation = data.cooldown_deviation,
    range = data.range,
    range_mode = data.range_mode,
    min_attack_distance = data.min_attack_distance,
    --projectile_creation_distance = 1.9,
    damage_modifier = data.damage_modifier,
    warmup = 30,
    projectile_creation_parameters = spitter_shoot_shiftings(data.scale, data.scale * scale_spitter_stream),
    use_shooter_direction = true,

    lead_target_for_projectile_speed = 0.2* 0.75 * 1.5 *1.5, -- this is same as particle horizontal speed of flamethrower fire stream

    ammo_type =
    {
      action =
      {
        type = "direct",
        action_delivery =
        {
          type = "stream",
          stream = data.acid_stream_name
        }
      }
    },
    cyclic_sound =
    {
      begin_sound =
      {
        category = "enemy",
        variations = sound_variations("__base__/sound/creatures/spitter-spit-start-mid", 5, 0.35),
        aggregation = { max_count = 3, remove = true, count_already_playing = true}
      }
    },
    animation = old_spitterattackanimation(data.scale, data.tint1)
  }
end

local function old_spitter_big_attack_parameters(data)
  return
  {
    type = "stream",
    ammo_category = "biological",
    cooldown = data.cooldown,
    cooldown_deviation = data.cooldown_deviation,
    range = data.range,
    range_mode = data.range_mode,
    min_attack_distance = data.min_attack_distance,
    --projectile_creation_distance = 1.9,
    damage_modifier = data.damage_modifier,
    warmup = 30,
    projectile_creation_parameters = spitter_shoot_shiftings(data.scale, data.scale * scale_spitter_stream),
    use_shooter_direction = true,

    lead_target_for_projectile_speed = 0.2* 0.75 * 1.5 *1.5, -- this is same as particle horizontal speed of flamethrower fire stream

    ammo_type =
    {
      action =
      {
        type = "direct",
        action_delivery =
        {
          type = "stream",
          stream = data.acid_stream_name
        }
      }
    },
    cyclic_sound =
    {
      begin_sound =
      {
        category = "enemy",
        variations = sound_variations("__base__/sound/creatures/spitter-spit-start-big", 10, 0.47),
        aggregation = { max_count = 3, remove = true, count_already_playing = true}
      }
    },
    --sound = sounds.spitter_roars(data.roarvolume),
    animation = old_spitterattackanimation(data.scale, data.tint1)
  }
end

local function old_spitter_behemoth_attack_parameters(data)
  return
  {
    type = "stream",
    ammo_category = "biological",
    cooldown = data.cooldown,
    cooldown_deviation = data.cooldown_deviation,
    range = data.range,
    range_mode = data.range_mode,
    min_attack_distance = data.min_attack_distance,
    --projectile_creation_distance = 1.9,
    damage_modifier = data.damage_modifier,
    warmup = 30,
    projectile_creation_parameters = spitter_shoot_shiftings(data.scale, data.scale * scale_spitter_stream),
    use_shooter_direction = true,

    lead_target_for_projectile_speed = 0.2* 0.75 * 1.5 *1.5, -- this is same as particle horizontal speed of flamethrower fire stream

    ammo_type =
    {
      action =
      {
        type = "direct",
        action_delivery =
        {
          type = "stream",
          stream = data.acid_stream_name
        }
      }
    },
    cyclic_sound =
    {
      begin_sound =
      {
        category = "enemy",
        variations = sound_variations("__base__/sound/creatures/spitter-spit-start-behemoth", 8, 0.47),
        aggregation = { max_count = 3, remove = true, count_already_playing = true}
      },
      end_sound =
      {
        category = "enemy",
        variations = sound_variations("__base__/sound/creatures/spitter-spit-end-big", 5, 0.43),
        aggregation = { max_count = 3, remove = true, count_already_playing = true}
      }
    },
    animation = old_spitterattackanimation(data.scale, data.tint1)
  }
end


local function old_add_spitter_die_animation(scale, tint1, corpse)
  corpse.animation = old_spitterdyinganimation(scale, tint1)
  --corpse.decay_animation = spitter_decay_animation(scale, tint1, tint2)
  --corpse.decay_frame_transition_duration = 6 * 60
  corpse.use_decay_layer = true
  corpse.dying_speed = (1 / 25) * (0.27 + 0.1 / scale)
  corpse.time_before_removed = 15 * 60 * 60
  corpse.direction_shuffle = { { 1, 2, 3, 16 }, { 4, 5, 6, 7 }, { 8, 9, 10, 11 }, { 12, 13, 14, 15 } }
  corpse.shuffle_directions_at_frame = 0
  corpse.final_render_layer = "lower-object-above-shadow"

  corpse.ground_patch_render_layer = "decals" -- "transport-belt-integration"
  corpse.ground_patch_fade_in_delay = 1 / 0.02 --  in ticks; 1/dying_speed to delay the animation until dying animation finishes
  corpse.ground_patch_fade_in_speed = 0.002
  corpse.ground_patch_fade_out_start = 50 * 60
  corpse.ground_patch_fade_out_duration = 20 * 60

  local a = 1
  local d = 0.9
  corpse.ground_patch =
  {
    sheet =
      util.sprite_load("__base__/graphics/entity/biter/blood-puddle-var-main",
        {
          flags = { "low-object" },
          variation_count = 4,
          scale = scale * 0.5,
          tint = {r = 0.6 * d * a, g = 0.1 * d * a, b = 0.6 * d * a, a = a},
          multiply_shift = scale,
          allow_forced_downscale = true,
        }
      )

  }
  return corpse
end

  return corpse
end


data:extend(
{

  ---------- BITERS ----------
  {
    type = "unit",
    name = "old-small-biter",
    icon = modgraphics .. "icons/old-small-biter.png",
    flags = {"placeable-player", "placeable-enemy", "placeable-off-grid", "not-repairable", "breaths-air"},
    max_health = 15,
    order = "b-a-a",
    subgroup = "enemies",
    factoriopedia_simulation = simulations.factoriopedia_small_biter,
    resistances = {},
    healing_per_tick = 0.01,
    collision_box = {{-0.2, -0.2}, {0.2, 0.2}},
    selection_box = {{-0.4, -0.7}, {0.4, 0.4}},
    damaged_trigger_effect = hit_effects.biter(),
    attack_parameters =
    {
      type = "projectile",
      range = 0.5,
      cooldown = 35,
      cooldown_deviation = 0.15,
      ammo_category = "melee",
      ammo_type = make_unit_melee_ammo_type(7),
      sound = sounds.biter_roars(0.35),
      animation = old_biterattackanimation(old_small_biter_scale, old_small_biter_tint1, old_small_biter_tint2),
      range_mode = "bounding-box-to-bounding-box"
    },
    impact_category = "organic",
    vision_distance = 30,
    movement_speed = 0.2,
    distance_per_frame = 0.125,
    absorptions_to_join_attack = { pollution = 4 },
    distraction_cooldown = 300,
    min_pursue_time = 10 * 60,
    max_pursue_distance = 50,
    corpse = "old-small-biter-corpse",
    dying_explosion = "small-biter-die",
    dying_sound = sounds.biter_dying(0.5),
    working_sound = sounds.biter_calls(0.4, 0.75),
    run_animation = old_biterrunanimation(old_small_biter_scale, old_small_biter_tint1, old_small_biter_tint2),
    running_sound_animation_positions = {2,},
    walking_sound = sounds.biter_walk(0, 0.3),
    ai_settings = biter_ai_settings,
    water_reflection = biter_water_reflection(old_small_biter_scale)
  },

  {
    type = "unit",
    name = "old-medium-biter",
    icon = modgraphics .. "icons/old-medium-biter.png",
    flags = {"placeable-player", "placeable-enemy", "placeable-off-grid", "breaths-air", "not-repairable"},
    max_health = 75,
    order = "b-a-b",
    subgroup = "enemies",
    factoriopedia_simulation = simulations.factoriopedia_medium_biter,
    resistances =
    {
      {
        type = "physical",
        decrease = 4,
        percent = 10
      },
      {
        type = "explosion",
        percent = 10
      }
    },
    impact_category = "organic",
    healing_per_tick = 0.01,
    collision_box = {{-0.3, -0.3}, {0.3, 0.3}},
    selection_box = {{-0.7, -1.5}, {0.7, 0.3}},
    damaged_trigger_effect = hit_effects.biter(),
    sticker_box = {{-0.3, -0.5}, {0.3, 0.1}},
    distraction_cooldown = 300,
    min_pursue_time = 10 * 60,
    max_pursue_distance = 50,
    attack_parameters =
    {
      type = "projectile",
      ammo_category = "melee",
      ammo_type = make_unit_melee_ammo_type(15),
      range = 1,
      cooldown = 35,
      cooldown_deviation = 0.15,
      sound = sounds.biter_roars_mid(0.73),
      animation = old_biterattackanimation(old_medium_biter_scale, old_medium_biter_tint1, old_medium_biter_tint2),
      range_mode = "bounding-box-to-bounding-box"
    },
    vision_distance = 30,
    movement_speed = 0.24,
    distance_per_frame = 0.188,
    -- in pu
    absorptions_to_join_attack = { pollution = 20 },
    corpse = "old-medium-biter-corpse",
    dying_explosion = "medium-biter-die",
    working_sound = sounds.biter_calls(0.4, 0.9),
    dying_sound = sounds.biter_dying(0.6),
    run_animation = old_biterrunanimation(old_medium_biter_scale, old_medium_biter_tint1, old_medium_biter_tint2),
    running_sound_animation_positions = {2,},
    walking_sound = sounds.biter_walk(0.1, 0.4),
    ai_settings = biter_ai_settings,
    water_reflection = biter_water_reflection(old_medium_biter_scale)
  },

  {
    type = "unit",
    name = "old-big-biter",
    order="b-a-c",
    icon = modgraphics .. "icons/old-big-biter.png",
    flags = {"placeable-player", "placeable-enemy", "placeable-off-grid", "breaths-air", "not-repairable"},
    max_health = 375,
    subgroup = "enemies",
    factoriopedia_simulation = simulations.factoriopedia_big_biter,
    impact_category = "organic",
    resistances =
    {
      {
        type = "physical",
        decrease = 8,
        percent = 10
      },
      {
        type = "explosion",
        percent = 10
      }
    },
    spawning_time_modifier = 3,
    healing_per_tick = 0.02,
    collision_box = {{-0.4, -0.4}, {0.4, 0.4}},
    selection_box = {{-0.7, -1.5}, {0.7, 0.3}},
    damaged_trigger_effect = hit_effects.biter(),
    sticker_box = {{-0.6, -0.8}, {0.6, 0}},
    distraction_cooldown = 300,
    min_pursue_time = 10 * 60,
    max_pursue_distance = 50,
    attack_parameters =
    {
      type = "projectile",
      range = 1.5,
      cooldown = 35,
      cooldown_deviation = 0.15,
      ammo_category = "melee",
      ammo_type = make_unit_melee_ammo_type(30),
      sound =  sounds.biter_roars_big(0.37),
      animation = old_biterattackanimation(old_big_biter_scale, old_big_biter_tint1, old_big_biter_tint2),
      range_mode = "bounding-box-to-bounding-box"
    },
    vision_distance = 30,
    movement_speed = 0.23,
    distance_per_frame = 0.30,
    -- in pu
    absorptions_to_join_attack = { pollution = 80 },
    corpse = "old-big-biter-corpse",
    dying_explosion = "big-biter-die",
    working_sound = sounds.biter_calls_big(0.4, 0.7),
    dying_sound = sounds.biter_dying_big(0.45),
    run_animation = old_biterrunanimation(old_big_biter_scale, old_big_biter_tint1, old_big_biter_tint2),
    running_sound_animation_positions = {2,},
    walking_sound = sounds.biter_walk_big(0.6, 0.7),
    ai_settings = biter_ai_settings,
    water_reflection = biter_water_reflection(old_big_biter_scale)
  },

  {
    type = "unit",
    name = "old-behemoth-biter",
    order="b-a-d",
    icon = modgraphics .. "icons/old-behemoth-biter.png",
    flags = {"placeable-player", "placeable-enemy", "placeable-off-grid", "breaths-air", "not-repairable"},
    max_health = 3000,
    subgroup = "enemies",
    factoriopedia_simulation = simulations.factoriopedia_behemoth_biter,
    resistances =
    {
      {
        type = "physical",
        decrease = 12,
        percent = 10
      },
      {
        type = "explosion",
        decrease = 12,
        percent = 10
      }
    },
    impact_category = "organic",
    spawning_time_modifier = 12,
    healing_per_tick = 0.1,
    collision_box = {{-0.4, -0.4}, {0.4, 0.4}},
    selection_box = {{-0.7, -1.5}, {0.7, 0.3}},
    damaged_trigger_effect = hit_effects.biter(),
    sticker_box = {{-0.6, -0.8}, {0.6, 0}},
    distraction_cooldown = 300,
    min_pursue_time = 10 * 60,
    max_pursue_distance = 50,
    attack_parameters =
    {
      type = "projectile",
      range = 1.5,
      cooldown = 50,
      cooldown_deviation = 0.15,
      ammo_category = "melee",
      ammo_type = make_unit_melee_ammo_type(90),
      sound =  sounds.biter_roars_behemoth(0.65),
      animation = old_biterattackanimation(old_behemoth_biter_scale, old_behemoth_biter_tint1, old_behemoth_biter_tint2),
      range_mode = "bounding-box-to-bounding-box"
    },
    vision_distance = 30,
    movement_speed = 0.3,
    distance_per_frame = 0.32,
    -- in pu
    absorptions_to_join_attack = { pollution = 400 },
    corpse = "old-behemoth-biter-corpse",
    dying_explosion = "behemoth-biter-die",
    working_sound = sounds.biter_calls_behemoth(0.5, 0.9),
    dying_sound = sounds.biter_dying_big(0.52),
    run_animation = old_biterrunanimation(old_behemoth_biter_scale, old_behemoth_biter_tint1, old_behemoth_biter_tint2),
    running_sound_animation_positions = {2,},
    walking_sound = sounds.biter_walk_big(0.6, 0.8),
    ai_settings = biter_ai_settings,
    water_reflection = biter_water_reflection(old_behemoth_biter_scale)
  },



  old_add_biter_die_animation(old_small_biter_scale, old_small_biter_tint1, old_small_biter_tint2,
  {
    type = "corpse",
    name = "old-small-biter-corpse",
    icon = modgraphics .. "icons/old-small-biter-corpse.png",
    selection_box = {{-0.8, -0.8}, {0.8, 0.8}},
    selectable_in_game = false,
    hidden_in_factoriopedia = true,
    subgroup="corpses",
    order = "c[corpse]-a[biter]-a[small]",
    flags = {"placeable-neutral", "placeable-off-grid", "building-direction-8-way", "not-repairable", "not-on-map"}
  }),

  old_add_biter_die_animation(old_medium_biter_scale, old_medium_biter_tint1, old_medium_biter_tint2,
  {
    type = "corpse",
    name = "old-medium-biter-corpse",
    icon = modgraphics .. "icons/old-medium-biter-corpse.png",
    selectable_in_game = false,
    selection_box = {{-1, -1}, {1, 1}},
    subgroup="corpses",
    order = "c[corpse]-a[biter]-b[medium]",
    hidden_in_factoriopedia = true,
    flags = {"placeable-neutral", "placeable-off-grid", "building-direction-8-way", "not-on-map"}
  }),

  old_add_biter_die_animation(old_big_biter_scale, old_big_biter_tint1, old_big_biter_tint2,
  {
    type = "corpse",
    name = "old-big-biter-corpse",
    icon = modgraphics .. "icons/old-big-biter-corpse.png",
    selectable_in_game = false,
    selection_box = {{-1, -1}, {1, 1}},
    subgroup="corpses",
    order = "c[corpse]-a[biter]-c[big]",
    hidden_in_factoriopedia = true,
    flags = {"placeable-neutral", "placeable-off-grid", "building-direction-8-way", "not-on-map"}
  }),

  old_add_biter_die_animation(old_behemoth_biter_scale, old_behemoth_biter_tint1, old_behemoth_biter_tint2,
  {
    type = "corpse",
    name = "old-behemoth-biter-corpse",
    icon = modgraphics .. "icons/old-behemoth-biter-corpse.png",
    selectable_in_game = false,
    selection_box = {{-1, -1}, {1, 1}},
    subgroup="corpses",
    order = "c[corpse]-a[biter]-d[behemoth]",
    hidden_in_factoriopedia = true,
    flags = {"placeable-neutral", "placeable-off-grid", "building-direction-8-way", "not-on-map"}
  }),










---------- SPITTERS ----------







  {
    type = "unit",
    name = "old-small-spitter",
    icon = modgraphics .. "icons/old-small-spitter.png",
    flags = {"placeable-player", "placeable-enemy", "placeable-off-grid", "breaths-air", "not-repairable"},
    max_health = 10,
    order = "b-b-a",
    subgroup = "enemies",
    factoriopedia_simulation = simulations.factoriopedia_small_spitter,
    impact_category = "organic",
    resistances = {},
    healing_per_tick = 0.01,
    collision_box = {{-0.3, -0.3}, {0.3, 0.3}},
    selection_box = {{-0.4, -0.4}, {0.4, 0.4}},
    damaged_trigger_effect = hit_effects.biter(),
    sticker_box = {{-0.3, -0.5}, {0.3, 0.1}},
    distraction_cooldown = 300,
    min_pursue_time = 10 * 60,
    max_pursue_distance = 50,

    alternative_attacking_frame_sequence = spitter_alternative_attacking_animation_sequence,
    attack_parameters = old_spitter_attack_parameters(
    {
      acid_stream_name = "acid-stream-spitter-small",
      range = range_spitter_small,
      min_attack_distance = 10,
      cooldown = 100,
      cooldown_deviation = 0.15,
      damage_modifier = damage_modifier_spitter_small,
      scale = old_small_spitter_scale,
      tint1 = old_small_spitter_tint,
      --tint2 = old_tint_2_spitter_small,
      roarvolume = 0.4,
      range_mode = "bounding-box-to-bounding-box"
    }),
    vision_distance = 30,
    movement_speed = 0.185,

    distance_per_frame = 0.04,
    -- in pu
    absorptions_to_join_attack = { pollution = 4 },
    corpse = "old-small-spitter-corpse",
    dying_explosion = "small-spitter-die",
    working_sound = sounds.spitter_calls(0.1, 0.44),
    dying_sound = sounds.spitter_dying(0.45),
    run_animation = old_spitterrunanimation(old_small_spitter_scale, old_small_spitter_tint),
    running_sound_animation_positions = {2,},
    walking_sound = sounds.spitter_walk(0, 0.3),
    ai_settings = biter_ai_settings,
    water_reflection = spitter_water_reflection(old_small_spitter_scale)
  },

  {
    type = "unit",
    name = "old-medium-spitter",
    icon = modgraphics .. "icons/old-medium-spitter.png",
    flags = {"placeable-player", "placeable-enemy", "placeable-off-grid", "breaths-air", "not-repairable"},
    max_health = 50,
    order = "b-b-b",
    subgroup = "enemies",
    factoriopedia_simulation = simulations.factoriopedia_medium_spitter,
    impact_category = "organic",
    resistances =
    {
      {
        type = "explosion",
        percent = 10
      }
    },
    healing_per_tick = 0.01,
    collision_box = {{-0.4, -0.4}, {0.4, 0.4}},
    selection_box = {{-0.5, -0.7}, {0.5, 0.7}},
    damaged_trigger_effect = hit_effects.biter(),
    sticker_box = {{-0.3, -0.5}, {0.3, 0.1}},
    distraction_cooldown = 300,
    min_pursue_time = 10 * 60,
    max_pursue_distance = 50,
    alternative_attacking_frame_sequence = spitter_alternative_attacking_animation_sequence,
    attack_parameters = old_spitter_mid_attack_parameters(
    {
      acid_stream_name = "acid-stream-spitter-medium",
      range = range_spitter_medium,
      min_attack_distance = 10,
      cooldown = 100,
      cooldown_deviation = 0.15,
      damage_modifier = damage_modifier_spitter_medium,
      scale = old_medium_spitter_scale,
      tint1 = old_medium_spitter_tint,
      --tint2 = tint_2_spitter_medium,
      roarvolume = 0.5,
      range_mode = "bounding-box-to-bounding-box"
    }),
    vision_distance = 30,
    movement_speed = 0.165,
    distance_per_frame = 0.055,
    -- in pu
    absorptions_to_join_attack = { pollution = 12 },
    corpse = "old-medium-spitter-corpse",
    dying_explosion = "medium-spitter-die",
    working_sound = sounds.spitter_calls_med(0.2, 0.53),
    dying_sound = sounds.spitter_dying_mid(0.65),
    run_animation = old_spitterrunanimation(old_medium_spitter_scale, old_medium_spitter_tint),
    running_sound_animation_positions = {2,},
    walking_sound = sounds.spitter_walk(0.1, 0.4),
    ai_settings = biter_ai_settings,
    water_reflection = spitter_water_reflection(old_medium_spitter_scale)
  },

  {
    type = "unit",
    name = "old-big-spitter",
    icon = modgraphics .. "icons/old-big-spitter.png",
    flags = {"placeable-player", "placeable-enemy", "placeable-off-grid", "breaths-air", "not-repairable"},
    max_health = 200,
    order = "b-b-c",
    subgroup = "enemies",
    factoriopedia_simulation = simulations.factoriopedia_big_spitter,
    impact_category = "organic",
    resistances =
    {
      {
        type = "explosion",
        percent = 15
      }
    },
    spawning_time_modifier = 3,
    healing_per_tick = 0.01,
    collision_box = {{-0.4, -0.4}, {0.4, 0.4}},
    selection_box = {{-0.7, -1.0}, {0.7, 1.0}},
    damaged_trigger_effect = hit_effects.biter(),
    sticker_box = {{-0.3, -0.5}, {0.3, 0.1}},
    distraction_cooldown = 300,
    min_pursue_time = 10 * 60,
    max_pursue_distance = 50,
    alternative_attacking_frame_sequence = spitter_alternative_attacking_animation_sequence,
    attack_parameters = old_spitter_big_attack_parameters(
    {
      acid_stream_name = "acid-stream-spitter-big",
      range = range_spitter_big,
      min_attack_distance = 10,
      cooldown = 100,
      cooldown_deviation = 0.15,
      damage_modifier = damage_modifier_spitter_big,
      scale = old_big_spitter_scale,
      tint1 = old_big_spitter_tint,
      --tint2 = old_tint_2_spitter_big,
      roarvolume = 0.6,
      range_mode = "bounding-box-to-bounding-box"
    }),
    vision_distance = 30,
    movement_speed = 0.15,
    distance_per_frame = 0.07,
    -- in pu
    absorptions_to_join_attack = { pollution = 30 },
    corpse = "old-big-spitter-corpse",
    dying_explosion = "big-spitter-die",
    working_sound = sounds.spitter_calls_big(0.2, 0.46),
    dying_sound = sounds.spitter_dying_big(0.71),
    run_animation = old_spitterrunanimation(old_big_spitter_scale, old_big_spitter_tint),
    running_sound_animation_positions = {2,},
    walking_sound = sounds.spitter_walk_big(0.2, 0.5),
    ai_settings = biter_ai_settings,
    water_reflection = spitter_water_reflection(old_big_spitter_scale)
  },

  {
    type = "unit",
    name = "old-behemoth-spitter",
    icon = modgraphics .. "icons/old-behemoth-spitter.png",
    flags = {"placeable-player", "placeable-enemy", "placeable-off-grid", "breaths-air", "not-repairable"},
    max_health = 1500,
    order = "b-b-d",
    subgroup = "enemies",
    factoriopedia_simulation = simulations.factoriopedia_behemoth_spitter,
    impact_category = "organic",
    resistances =
    {
      {
        type = "explosion",
        percent = 30
      }
    },
    spawning_time_modifier = 12,
    healing_per_tick = 0.1,
    collision_box = {{-0.4, -0.4}, {0.4, 0.4}},
    selection_box = {{-0.7, -1.0}, {0.7, 1.0}},
    damaged_trigger_effect = hit_effects.biter(),
    sticker_box = {{-0.3, -0.5}, {0.3, 0.1}},
    distraction_cooldown = 300,
    min_pursue_time = 10 * 60,
    max_pursue_distance = 50,
    alternative_attacking_frame_sequence = spitter_alternative_attacking_animation_sequence,
    attack_parameters = old_spitter_behemoth_attack_parameters(
    {
      acid_stream_name = "acid-stream-spitter-behemoth",
      range = range_spitter_behemoth,
      min_attack_distance = 10,
      cooldown = 100,
      cooldown_deviation = 0.15,
      damage_modifier = damage_modifier_spitter_behemoth,
      scale = old_behemoth_spitter_scale,
      tint1 = old_behemoth_spitter_tint,
      --tint2 = old_tint_2_spitter_behemoth,
      roarvolume = 0.8,
      range_mode = "bounding-box-to-bounding-box"
    }),
    vision_distance = 30,
    movement_speed = 0.15,
    distance_per_frame = 0.084,
    absorptions_to_join_attack = { pollution = 200 },
    corpse = "old-behemoth-spitter-corpse",
    dying_explosion = "behemoth-spitter-die",
    working_sound = sounds.spitter_calls_big(0.4, 0.6),
    dying_sound = sounds.spitter_dying_behemoth(0.70),
    run_animation = old_spitterrunanimation(old_behemoth_spitter_scale, old_behemoth_spitter_tint),
    running_sound_animation_positions = {2,},
    walking_sound = sounds.spitter_walk_big(0.3, 0.6),
    ai_settings = biter_ai_settings,
    water_reflection = spitter_water_reflection(old_behemoth_spitter_scale)
  },


  old_add_spitter_die_animation(old_small_spitter_scale, old_small_spitter_tint,
  {
    type = "corpse",
    name = "old-small-spitter-corpse",
    icon = modgraphics .. "icons/old-small-spitter-corpse.png",
    selectable_in_game = false,
    selection_box = {{-1, -1}, {1, 1}},
    subgroup="corpses",
    order = "c[corpse]-b[spitter]-a[small]",
    hidden_in_factoriopedia = true,
    flags = {"placeable-neutral", "placeable-off-grid", "building-direction-8-way", "not-on-map"}
  }),

  old_add_spitter_die_animation(old_medium_spitter_scale, old_medium_spitter_tint,
  {
    type = "corpse",
    name = "old-medium-spitter-corpse",
    icon = modgraphics .. "icons/old-medium-spitter-corpse.png",
    selectable_in_game = false,
    selection_box = {{-1, -1}, {1, 1}},
    subgroup="corpses",
    order = "c[corpse]-b[spitter]-b[medium]",
    hidden_in_factoriopedia = true,
    flags = {"placeable-neutral", "placeable-off-grid", "building-direction-8-way", "not-on-map"}
  }),

  old_add_spitter_die_animation(old_big_spitter_scale, old_big_spitter_tint,
  {
    type = "corpse",
    name = "old-big-spitter-corpse",
    icon = modgraphics .. "icons/old-big-spitter-corpse.png",
    selectable_in_game = false,
    selection_box = {{-1, -1}, {1, 1}},
    subgroup="corpses",
    order = "c[corpse]-b[spitter]-c[big]",
    hidden_in_factoriopedia = true,
    flags = {"placeable-neutral", "placeable-off-grid", "building-direction-8-way", "not-on-map"}
  }),

  old_add_spitter_die_animation(old_behemoth_spitter_scale, old_behemoth_spitter_tint,
  {
    type = "corpse",
    name = "old-behemoth-spitter-corpse",
    icon = modgraphics .. "icons/old-behemoth-spitter-corpse.png",
    selectable_in_game = false,
    selection_box = {{-1, -1}, {1, 1}},
    subgroup="corpses",
    order = "c[corpse]-b[spitter]-d[behemoth]",
    hidden_in_factoriopedia = true,
    flags = {"placeable-neutral", "placeable-off-grid", "building-direction-8-way", "not-on-map"}
  }),








  ------------- SPAWNERS ------------









  {
    type = "unit-spawner",
    name = "old-biter-spawner",
    icon = modgraphics .. "icons/old-biter-spawner.png",
    flags = {"placeable-player", "placeable-enemy", "not-repairable"},
    max_health = 350,
    order="b-d-a",
    subgroup="enemies",
    resistances =
    {
      {
        type = "physical",
        decrease = 2,
        percent = 15
      },
      {
        type = "explosion",
        decrease = 5
      },
      {
        type = "fire",
        decrease = 3,
        percent = 60
      }
    },
    working_sound =
    {
      sound = {category = "enemy", filename = "__base__/sound/creatures/spawner.ogg", volume = 0.6, modifiers = volume_multiplier("main-menu", 0.7) },
      max_sounds_per_prototype = 3
    },
    dying_sound =
    {
      variations = sound_variations("__base__/sound/creatures/spawner-death", 5, 0.7, volume_multiplier("main-menu", 0.55) ),
      aggregation = { max_count = 2, remove = true, count_already_playing = true }
    },
    healing_per_tick = 0.02,
    collision_box = {{-2.2, -2.2}, {2.2, 2.2}},
    map_generator_bounding_box = {{-3.7, -3.2}, {3.7, 3.2}},
    selection_box = {{-2.5, -2.5}, {2.5, 2.5}},
    damaged_trigger_effect = hit_effects.biter(),
    impact_category = "organic",
    -- in ticks per 1 pu
    absorptions_per_second = { pollution = { absolute = 20, proportional = 0.01 } },
    corpse = "old-biter-spawner-corpse",
    dying_explosion = "biter-spawner-die",
    max_count_of_owned_units = 7,
    max_friends_around_to_spawn = 5,
    graphics_set =
    {
      animations =
      {
        old_spawner_idle_animation(0, old_biter_spawner_tint),
        old_spawner_idle_animation(1, old_biter_spawner_tint),
        old_spawner_idle_animation(2, old_biter_spawner_tint),
        old_spawner_idle_animation(3, old_biter_spawner_tint)
      }
    },
    result_units = (function()
                     local res = {}
                     res[1] = {"old-small-biter", {{0.0, 0.3}, {0.6, 0.0}}}
                     if not data.is_demo then
                       -- from evolution_factor 0.3 the weight for medium-biter is linearly rising from 0 to 0.3
                       -- this means for example that when the evolution_factor is 0.45 the probability of spawning
                       -- a small biter is 66% while probability for medium biter is 33%.
                       res[2] = {"old-medium-biter", {{0.2, 0.0}, {0.6, 0.3}, {0.7, 0.1}}}
                       -- for evolution factor of 1 the spawning probabilities are: small-biter 0%, medium-biter 1/8, big-biter 4/8, behemoth biter 3/8
                       res[3] = {"old-big-biter", {{0.5, 0.0}, {1.0, 0.4}}}
                       res[4] = {"old-behemoth-biter", {{0.9, 0.0}, {1.0, 0.3}}}
                     end
                     return res
                   end)(),
    -- With zero evolution the spawn rate is 6 seconds, with max evolution it is 2.5 seconds
    spawning_cooldown = {360, 150},
    spawning_radius = 10,
    spawning_spacing = 3,
    max_spawn_shift = 0,
    max_richness_for_spawn_shift = 100,
    autoplace = enemy_autoplace.enemy_spawner_autoplace("enemy_autoplace_base(0, 6)"),
    call_for_help_radius = 50,
    time_to_capture = 60 * 20,
    spawn_decorations_on_expansion = true,
    spawn_decoration =
    {
      {
        decorative = "light-mud-decal",
        spawn_min = 0,
        spawn_max = 2,
        spawn_min_radius = 2,
        spawn_max_radius = 5
      },
      {
        decorative = "dark-mud-decal",
        spawn_min = 0,
        spawn_max = 3,
        spawn_min_radius = 2,
        spawn_max_radius = 6
      },
      {
        decorative = "enemy-decal",
        spawn_min = 3,
        spawn_max = 5,
        spawn_min_radius = 2,
        spawn_max_radius = 7
      },
      {
        decorative = "enemy-decal-transparent",
        spawn_min = 4,
        spawn_max = 20,
        spawn_min_radius = 2,
        spawn_max_radius = 14,
        radius_curve = 0.9
      },
      {
        decorative = "muddy-stump",
        spawn_min = 2,
        spawn_max = 5,
        spawn_min_radius = 3,
        spawn_max_radius = 6
      },
      {
        decorative = "red-croton",
        spawn_min = 2,
        spawn_max = 8,
        spawn_min_radius = 3,
        spawn_max_radius = 6
      },
      {
        decorative = "red-pita",
        spawn_min = 1,
        spawn_max = 5,
        spawn_min_radius = 3,
        spawn_max_radius = 6
      }
    }
  },

  {
    type = "corpse",
    name = "old-biter-spawner-corpse",
    hidden_in_factoriopedia = true,
    flags = {"placeable-neutral", "placeable-off-grid", "not-on-map"},
    icon = modgraphics .. "icons/old-biter-spawner-corpse.png",
    collision_box = {{-2, -2}, {2, 2}},
    selection_box = {{-2, -2}, {2, 2}},
    selectable_in_game = false,
    dying_speed = 0.015,
    time_before_removed = 15 * 60 * 60,
    subgroup="corpses",
    order = "c[corpse]-b[biter-spawner]",
    animation =
    {
      old_spawner_die_animation(0, old_biter_spawner_tint),
      old_spawner_die_animation(1, old_biter_spawner_tint),
      old_spawner_die_animation(2, old_biter_spawner_tint),
      old_spawner_die_animation(3, old_biter_spawner_tint)
    },
    --[[
    decay_animation =
    {
      spawner_decay_animation(0, biter_spawner_tint),
      spawner_decay_animation(1, biter_spawner_tint),
      spawner_decay_animation(2, biter_spawner_tint),
      spawner_decay_animation(3, biter_spawner_tint)
    },
    decay_frame_transition_duration = 6 * 60,
    ]]
    -- use_decay_layer = true,
    final_render_layer = "lower-object-above-shadow" -- this is essentially ignored when 'use_decay_layer' is true
  },


  {
    type = "unit-spawner",
    name = "old-spitter-spawner",
    icon = modgraphics .. "icons/old-spitter-spawner.png",
    flags = {"placeable-player", "placeable-enemy", "not-repairable"},
    max_health = 350,
    order="b-d-b",
    subgroup="enemies",
    working_sound =
    {
      sound = {category = "enemy", filename = "__base__/sound/creatures/spawner-spitter.ogg", volume = 0.6, modifiers = volume_multiplier("main-menu", 0.7) },
      max_sounds_per_prototype = 3
    },
    dying_sound =
    {
      variations = sound_variations("__base__/sound/creatures/spawner-death", 5, 0.7, volume_multiplier("main-menu", 1.21) ),
      aggregation = { max_count = 2, remove = true, count_already_playing = true }
    },
    impact_category = "organic",
    resistances =
    {
      {
        type = "physical",
        decrease = 2,
        percent = 15
      },
      {
        type = "explosion",
        decrease = 5
      },
      {
        type = "fire",
        decrease = 3,
        percent = 60
      }
    },
    healing_per_tick = 0.02,
    collision_box = {{-2.2, -2.2}, {2.2, 2.2}},
    map_generator_bounding_box = {{-3.7, -3.2}, {3.7, 3.2}},
    selection_box = {{-2.5, -2.5}, {2.5, 2.5}},
    damaged_trigger_effect = hit_effects.biter(),
    absorptions_per_second = { pollution = { absolute = 20, proportional = 0.01 } },
    corpse = "old-spitter-spawner-corpse",
    dying_explosion = "spitter-spawner-die",
    max_count_of_owned_units = 7,
    max_friends_around_to_spawn = 5,
    graphics_set =
    {
      animations =
      {
        old_spawner_idle_animation(0, old_spitter_spawner_tint, true),
        old_spawner_idle_animation(1, old_spitter_spawner_tint, true),
        old_spawner_idle_animation(2, old_spitter_spawner_tint, true),
        old_spawner_idle_animation(3, old_spitter_spawner_tint, true)
      },
    },
    result_units =
    {
      {"old-small-biter", {{0.0, 0.3}, {0.35, 0}}},
      {"old-small-spitter", {{0.25, 0.0}, {0.5, 0.3}, {0.7, 0.0}}},
      {"old-medium-spitter", {{0.4, 0.0}, {0.7, 0.3}, {0.9, 0.1}}},
      {"old-big-spitter", {{0.5, 0.0}, {1.0, 0.4}}},
      {"old-behemoth-spitter", {{0.9, 0.0}, {1.0, 0.3}}},
    },
    -- With zero evolution the spawn rate is 6 seconds, with max evolution it is 2.5 seconds
    spawning_cooldown = {360, 150},
    spawning_radius = 10,
    spawning_spacing = 3,
    max_spawn_shift = 0,
    max_richness_for_spawn_shift = 100,
    -- distance_factor used to be 1, but Twinsen says:
    -- "The number or spitter spwners should be roughly equal to the number of biter spawners(regardless of difficulty)."
    -- (2018-12-07)
    autoplace = enemy_autoplace.enemy_spawner_autoplace("enemy_autoplace_base(0, 7)"),
    call_for_help_radius = 50,
    time_to_capture = 60 * 30,
    spawn_decorations_on_expansion = true,
    spawn_decoration =
    {
      {
        decorative = "light-mud-decal",
        spawn_min = 0,
        spawn_max = 2,
        spawn_min_radius = 2,
        spawn_max_radius = 5
      },
      {
        decorative = "dark-mud-decal",
        spawn_min = 0,
        spawn_max = 3,
        spawn_min_radius = 2,
        spawn_max_radius = 6
      },
      {
        decorative = "enemy-decal",
        spawn_min = 3,
        spawn_max = 5,
        spawn_min_radius = 2,
        spawn_max_radius = 7
      },
      {
        decorative = "enemy-decal-transparent",
        spawn_min = 4,
        spawn_max = 20,
        spawn_min_radius = 2,
        spawn_max_radius = 14,
        radius_curve = 0.9
      },
      {
        decorative = "muddy-stump",
        spawn_min = 2,
        spawn_max = 5,
        spawn_min_radius = 3,
        spawn_max_radius = 6
      },
      {
        decorative = "red-croton",
        spawn_min = 2,
        spawn_max = 8,
        spawn_min_radius = 3,
        spawn_max_radius = 6
      },
      {
        decorative = "red-pita",
        spawn_min = 1,
        spawn_max = 5,
        spawn_min_radius = 3,
        spawn_max_radius = 6
      },
      {
        decorative = "lichen-decal",
        spawn_min = 1,
        spawn_max = 2,
        spawn_min_radius = 2,
        spawn_max_radius = 7
      }
    }
  },

  {
    type = "corpse",
    name = "old-spitter-spawner-corpse",
    hidden_in_factoriopedia = true,
    flags = {"placeable-neutral", "placeable-off-grid", "not-on-map"},
    icon = modgraphics .. "icons/old-spitter-spawner-corpse.png",
    collision_box = {{-2, -2}, {2, 2}},
    selection_box = {{-2, -2}, {2, 2}},
    selectable_in_game = false,
    dying_speed = 0.015,
    time_before_removed = 15 * 60 * 60,
    subgroup="corpses",
    order = "c[corpse]-c[spitter-spawner]",
    animation =
    {
      old_spawner_die_animation(0, old_spitter_spawner_tint, true),
      old_spawner_die_animation(1, old_spitter_spawner_tint, true),
      old_spawner_die_animation(2, old_spitter_spawner_tint, true),
      old_spawner_die_animation(3, old_spitter_spawner_tint, true)
    },
    --[[decay_animation =
    {
      spawner_decay_animation(0, old_spitter_spawner_tint),
      spawner_decay_animation(1, old_spitter_spawner_tint),
      spawner_decay_animation(2, old_spitter_spawner_tint),
      spawner_decay_animation(3, old_spitter_spawner_tint)
    },
    decay_frame_transition_duration = 6 * 60,]]
    -- use_decay_layer = true,
    final_render_layer = "lower-object-above-shadow",
  },





---------------- WORMS ------------------



  {
    type = "turret",
    name = "old-small-worm-turret",
    icon = modgraphics .. "icons/old-small-worm-turret.png",
    flags = {"placeable-enemy", "placeable-off-grid", "not-repairable", "breaths-air"},
    order="b-c-a",
    max_health = 200,
    subgroup = "enemies",
    impact_category = "organic",
    resistances = {},
    healing_per_tick = 0.01,
    collision_box = {{-0.9, -0.8 }, {0.9, 0.8}},
    map_generator_bounding_box = {{-1.9, -1.8}, {1.9, 1.8}},
    selection_box = {{-0.9, -0.8 }, {0.9, 0.8}},
    damaged_trigger_effect = hit_effects.biter(),
    shooting_cursor_size = 3,
    corpse = "old-small-worm-corpse",
    folded_state_corpse = "old-small-worm-corpse-burrowed",
    dying_explosion = "small-worm-die",
    dying_sound = sounds.worm_dying_small(0.57),
    graphics_set = {},
    folded_speed = 0.01,
    folded_speed_secondary = 0.024,
    folded_animation_is_stateless = true,
    folded_animation = old_worm_folded_animation(old_small_worm_scale, old_small_worm_tint),
    preparing_speed = 0.024,
    preparing_speed_when_killed = 0.024 * preparing_speed_multiplier_when_killed,
    preparing_animation = old_worm_preparing_animation(old_small_worm_scale, old_small_worm_tint, "forward"),
    preparing_sound = sounds.worm_standup_small(0.6),
    prepared_speed = 0.024,
    prepared_speed_secondary = 0.012,
    prepared_sound = sounds.worm_breath(0.4, 0.6),
    prepared_animation = old_worm_prepared_animation(old_small_worm_scale, old_small_worm_tint),
    prepared_alternative_speed = 0.024,
    prepared_alternative_speed_secondary = 0.018,
    prepared_alternative_speed_when_killed = 0.024 * prepared_alternative_speed_multiplier_when_killed,
    prepared_alternative_starting_progress_when_killed = prepared_starting_progress_when_killed,
    prepared_alternative_chance = 0.2,
    prepared_alternative_animation = old_worm_prepared_animation(old_small_worm_scale, old_small_worm_tint),
    prepared_alternative_sound = sounds.worm_roar_alternative(0.4, 0.6),
    starting_attack_speed = 0.034,
    starting_attack_speed_when_killed = 0.034 * start_attack_speed_multiplier_when_killed,
    starting_attack_animation = old_worm_attack_animation(old_small_worm_scale, old_small_worm_tint, "forward"),
    starting_attack_sound = sounds.worm_roars(0.4, 0.6),
    ending_attack_speed = 0.016,
    ending_attack_speed_when_killed = 0.016 * end_attack_speed_multiplier_when_killed,
    ending_attack_starting_progress_when_killed = end_attack_starting_progress_when_killed,
    ending_attack_animation = old_worm_attack_animation(old_small_worm_scale, old_small_worm_tint, "backward"),
    folding_speed = 0.015,
    folding_speed_when_killed = 0.015 * folding_speed_multiplier_when_killed,
    folding_animation = old_worm_preparing_animation(old_small_worm_scale, old_small_worm_tint, "backward"),
    folding_sound = sounds.worm_fold(1),
    random_animation_offset = true,
    attack_from_start_frame = true,

    --integration = worm_integration(old_small_worm_scale, true),
    prepare_range = range_worm_small + prepare_range_worm_small,
    allow_turning_when_starting_attack = true,
    attack_parameters =
    {
      type = "stream",
      cooldown = 4,
      range = range_worm_small,--defined in enemy-constants.lua
      damage_modifier = damage_modifier_worm_small,--defined in enemy-constants.lua
      min_range = 0,
      projectile_creation_parameters = worm_shoot_shiftings(old_small_worm_scale, old_small_worm_scale * scale_worm_stream),
      use_shooter_direction = true,

      lead_target_for_projectile_speed = 0.2* 0.75 * 1.5 *1.5, -- this is same as particle horizontal speed of flamethrower fire stream

      ammo_category = "biological",
      ammo_type =
      {
        action =
        {
          type = "direct",
          action_delivery =
          {
            type = "stream",
            stream = "acid-stream-worm-small",
            source_offset = {0.15, -0.5}
          }
        }
      },
    },
    autoplace = enemy_autoplace.enemy_worm_autoplace("enemy_autoplace_base(0, 2)"),
    call_for_help_radius = 40,
    spawn_decorations_on_expansion = true,
    spawn_decoration =
    {
      {
        decorative = "worms-decal",
        spawn_min = 0,
        spawn_max = 2,
        spawn_min_radius = 1,
        spawn_max_radius = 2
      },
      {
        decorative = "shroom-decal",
        spawn_min = 1,
        spawn_max = 1,
        spawn_min_radius = 1,
        spawn_max_radius = 2
      },
      {
        decorative = "enemy-decal",
        spawn_min = 1,
        spawn_max = 2,
        spawn_min_radius = 0,
        spawn_max_radius = 1
      },
      {
        decorative = "enemy-decal-transparent",
        spawn_min = 2,
        spawn_max = 4,
        spawn_min_radius = 1,
        spawn_max_radius = 2
      }
    }
  },

  {
    type = "turret",
    name = "old-medium-worm-turret",
    icon = modgraphics .. "icons/old-medium-worm-turret.png",
    flags = {"placeable-player", "placeable-enemy", "placeable-off-grid", "not-repairable", "breaths-air"},
    order="b-c-b",
    subgroup="enemies",
    max_health = 500,
    impact_category = "organic",
    resistances =
    {
      {
        type = "physical",
        decrease = 5
      },
      {
        type = "explosion",
        decrease = 5,
        percent = 15
      },
      {
        type = "fire",
        decrease = 2,
        percent = 50
      },
      {
        type = "laser",
        percent = 20
      }
    },
    healing_per_tick = 0.015,
    collision_box = {{-1.1, -1.0}, {1.1, 1.0}},
    map_generator_bounding_box = {{-2.1, -2.0}, {2.1, 2.0}},
    selection_box = {{-1.1, -1.0}, {1.1, 1.0}},
    damaged_trigger_effect = hit_effects.biter(),
    shooting_cursor_size = 3.5,
    rotation_speed = 1,
    corpse = "old-medium-worm-corpse",
    folded_state_corpse = "old-medium-worm-corpse-burrowed",
    dying_explosion = "medium-worm-die",
    dying_sound = sounds.worm_dying(0.65),
    graphics_set = {},
    folded_speed = 0.01,
    folded_speed_secondary = 0.024,
    folded_animation_is_stateless = true,
    folded_animation = old_worm_folded_animation(old_medium_worm_scale, old_medium_worm_tint),
    preparing_speed = 0.024,
    preparing_speed_when_killed = 0.024 * preparing_speed_multiplier_when_killed,
    preparing_animation = old_worm_preparing_animation(old_medium_worm_scale, old_medium_worm_tint, "forward"),
    preparing_sound = sounds.worm_standup(0.6),
    prepared_speed = 0.024,
    prepared_speed_secondary = 0.012,
    prepared_sound = sounds.worm_breath(0.6, 0.8),
    prepared_alternative_speed = 0.014,
    prepared_alternative_speed_secondary = 0.010,
    prepared_alternative_speed_when_killed = 0.014 * prepared_alternative_speed_multiplier_when_killed,
    prepared_alternative_starting_progress_when_killed = prepared_starting_progress_when_killed,
    prepared_alternative_chance = 0.2,
    prepared_alternative_animation = old_worm_prepared_animation(old_medium_worm_scale, old_medium_worm_tint),
    prepared_alternative_sound = sounds.worm_roar_alternative(0.4, 0.7),
    prepared_animation = old_worm_prepared_animation(old_medium_worm_scale, old_medium_worm_tint),
    starting_attack_speed = 0.034,
    starting_attack_animation = old_worm_attack_animation(old_medium_worm_scale, old_medium_worm_tint, "forward"),
    starting_attack_sound = sounds.worm_roars(0.4, 0.7),
    starting_attack_speed_when_killed = 0.034 * start_attack_speed_multiplier_when_killed,
    ending_attack_speed = 0.016,
    ending_attack_speed_when_killed = 0.016 * end_attack_speed_multiplier_when_killed,
    ending_attack_starting_progress_when_killed = end_attack_starting_progress_when_killed,
    ending_attack_animation = old_worm_attack_animation(old_medium_worm_scale, old_medium_worm_tint, "backward"),
    folding_speed = 0.015,
    folding_speed_when_killed = 0.015 * folding_speed_multiplier_when_killed,
    folding_animation = old_worm_preparing_animation(old_medium_worm_scale, old_medium_worm_tint, "backward"),
    folding_sound = sounds.worm_fold(1),
    random_animation_offset = true,
    attack_from_start_frame = true,

    --integration = worm_integration(old_medium_worm_scale, true),
    prepare_range = range_worm_medium + prepare_range_worm_medium,
    allow_turning_when_starting_attack = true,

    attack_parameters =
    {
      type = "stream",
      cooldown = 4,
      range = range_worm_medium,--defined in spitter-projectiles.lua
      damage_modifier = damage_modifier_worm_medium,--defined in spitter-projectiles.lua
      min_range = 0,
      projectile_creation_parameters = worm_shoot_shiftings(old_medium_worm_scale, old_medium_worm_scale * scale_worm_stream),

      use_shooter_direction = true,

      lead_target_for_projectile_speed = 0.2* 0.75 * 1.5 *1.5, -- this is same as particle horizontal speed of flamethrower fire stream

      ammo_category = "biological",
      ammo_type =
      {
        action =
        {
          type = "direct",
          action_delivery =
          {
            type = "stream",
            stream = "acid-stream-worm-medium",
            source_offset = {0.15, -0.5}
          }
        }
      }
    },
    build_base_evolution_requirement = 0.3,
    autoplace = enemy_autoplace.enemy_worm_autoplace("enemy_autoplace_base(2, 3)"),
    call_for_help_radius = 40,
    spawn_decorations_on_expansion = true,
    spawn_decoration =
    {
      {
        decorative = "worms-decal",
        spawn_min = 1,
        spawn_max = 2,
        spawn_min_radius = 1,
        spawn_max_radius = 3
      },
      {
        decorative = "shroom-decal",
        spawn_min = 1,
        spawn_max = 2,
        spawn_min_radius = 1,
        spawn_max_radius = 2
      },
      {
        decorative = "enemy-decal",
        spawn_min = 1,
        spawn_max = 3,
        spawn_min_radius = 0,
        spawn_max_radius = 3
      },
      {
        decorative = "enemy-decal-transparent",
        spawn_min = 2,
        spawn_max = 4,
        spawn_min_radius = 1,
        spawn_max_radius = 3
      }
    }
  },

  {
    type = "turret",
    name = "old-big-worm-turret",
    icon = modgraphics .. "icons/old-big-worm-turret.png",
    flags = {"placeable-player", "placeable-enemy", "placeable-off-grid", "not-repairable", "breaths-air"},
    max_health = 1500,
    order = "b-c-c",
    subgroup = "enemies",
    impact_category = "organic",
    resistances =
    {
      {
        type = "physical",
        decrease = 10
      },
      {
        type = "explosion",
        decrease = 10,
        percent = 30
      },
      {
        type = "fire",
        decrease = 3,
        percent = 70
      },
      {
        type = "laser",
        percent = 50
      }
    },
    healing_per_tick = 0.02,
    collision_box = {{-1.4, -1.2}, {1.4, 1.2}},
    map_generator_bounding_box = {{-2.4, -2.2}, {2.4, 2.2}},
    selection_box = {{-1.4, -1.2}, {1.4, 1.2}},
    damaged_trigger_effect = hit_effects.biter(),
    shooting_cursor_size = 4,
    rotation_speed = 1,
    corpse = "old-big-worm-corpse",
    folded_state_corpse = "old-big-worm-corpse-burrowed",
    dying_explosion = "big-worm-die",
    dying_sound = sounds.worm_dying_big(0.7),
    graphics_set = {},
    folded_speed = 0.01,
    folded_speed_secondary = 0.024,
    folded_animation_is_stateless = true,
    folded_animation = old_worm_folded_animation(old_big_worm_scale, old_big_worm_tint),
    preparing_speed = 0.024,
    preparing_speed_when_killed = 0.024 * preparing_speed_multiplier_when_killed,
    preparing_animation = old_worm_preparing_animation(old_big_worm_scale, old_big_worm_tint, "forward"),
    preparing_sound = sounds.worm_standup(0.7),
    prepared_speed = 0.024,
    prepared_speed_secondary = 0.012,
    prepared_animation = old_worm_prepared_animation(old_big_worm_scale, old_big_worm_tint),
    prepared_sound = sounds.worm_breath_big(0.6, 0.9),
    prepared_alternative_speed = 0.014,
    prepared_alternative_speed_secondary = 0.010,
    prepared_alternative_speed_when_killed = 0.014 * prepared_alternative_speed_multiplier_when_killed,
    prepared_alternative_starting_progress_when_killed = prepared_starting_progress_when_killed,
    prepared_alternative_chance = 0.2,
    prepared_alternative_animation = old_worm_prepared_animation(old_big_worm_scale, old_big_worm_tint),
    prepared_alternative_sound = sounds.worm_roar_alternative_big(0.4, 0.7),
    starting_attack_speed = 0.034,
    starting_attack_animation = old_worm_attack_animation(old_big_worm_scale, old_big_worm_tint, "forward"),
    starting_attack_sound = sounds.worm_roars_big(0.4, 0.7),
    starting_attack_speed_when_killed = 0.034 * start_attack_speed_multiplier_when_killed,
    ending_attack_speed = 0.016,
    ending_attack_speed_when_killed = 0.016 * end_attack_speed_multiplier_when_killed,
    ending_attack_starting_progress_when_killed = end_attack_starting_progress_when_killed,
    ending_attack_animation = old_worm_attack_animation(old_big_worm_scale, old_big_worm_tint, "backward"),
    folding_speed = 0.015,
    folding_speed_when_killed = 0.015 * folding_speed_multiplier_when_killed,
    folding_animation = old_worm_preparing_animation(old_big_worm_scale, old_big_worm_tint, "backward"),
    folding_sound = sounds.worm_fold(1),
    --integration = worm_integration(old_big_worm_scale, true),
    random_animation_offset = true,
    attack_from_start_frame = true,

    prepare_range = range_worm_big + prepare_range_worm_big,
    allow_turning_when_starting_attack = true,
    attack_parameters =
    {
      type = "stream",
      damage_modifier = damage_modifier_worm_big,--defined in spitter-projectiles.lua
      cooldown = 4,
      range = range_worm_big,--defined in spitter-projectiles.lua
      min_range = 0,
      projectile_creation_parameters = worm_shoot_shiftings(old_big_worm_scale, old_big_worm_scale * scale_worm_stream),

      use_shooter_direction = true,

      lead_target_for_projectile_speed = 0.2* 0.75 * 1.5 * 1.5, -- this is same as particle horizontal speed of flamethrower fire stream

      ammo_category = "biological",
      ammo_type =
      {
        action =
        {
          type = "direct",
          action_delivery =
          {
            type = "stream",
            stream = "acid-stream-worm-big",
            source_offset = {0.15, -0.5}
          }
        }
      }
    },
    build_base_evolution_requirement = 0.5,
    autoplace = enemy_autoplace.enemy_worm_autoplace("enemy_autoplace_base(5, 4)"),
    call_for_help_radius = 40,
    spawn_decorations_on_expansion = true,
    spawn_decoration =
    {
      {
        decorative = "worms-decal",
        spawn_min = 1,
        spawn_max = 2,
        spawn_min_radius = 1,
        spawn_max_radius = 4
      },
      {
        decorative = "shroom-decal",
        spawn_min = 1,
        spawn_max = 2,
        spawn_min_radius = 1,
        spawn_max_radius = 2
      },
      {
        decorative = "enemy-decal",
        spawn_min = 1,
        spawn_max = 4,
        spawn_min_radius = 1,
        spawn_max_radius = 3
      },
      {
        decorative = "enemy-decal-transparent",
        spawn_min = 3,
        spawn_max = 5,
        spawn_min_radius = 1,
        spawn_max_radius = 4
      }
    }
  },
  {
    type = "turret",
    name = "old-behemoth-worm-turret",
    icon = modgraphics .. "icons/old-behemoth-worm-turret.png",
    flags = {"placeable-player", "placeable-enemy", "placeable-off-grid", "not-repairable", "breaths-air"},
    max_health = 3000,
    order = "b-c-d",
    subgroup = "enemies",
    impact_category = "organic",
    resistances =
    {
      {
        type = "physical",
        decrease = 10
      },
      {
        type = "explosion",
        decrease = 10,
        percent = 30
      },
      {
        type = "fire",
        decrease = 3,
        percent = 70
      },
      {
        type = "laser",
        percent = 80
      }
    },
    healing_per_tick = 0.02,
    collision_box = {{-1.4, -1.2}, {1.4, 1.2}},
    map_generator_bounding_box = {{-2.4, -2.2}, {2.4, 2.2}},
    selection_box = {{-1.4, -1.2}, {1.4, 1.2}},
    damaged_trigger_effect = hit_effects.biter(),
    shooting_cursor_size = 4,
    rotation_speed = 1,
    corpse = "old-behemoth-worm-corpse",
    folded_state_corpse = "old-behemoth-worm-corpse-burrowed",
    dying_explosion = "behemoth-worm-die",
    dying_sound = sounds.worm_dying_behemoth(0.8),
    graphics_set = {},
    folded_speed = 0.01,
    folded_speed_secondary = 0.024,
    folded_animation_is_stateless = true,
    folded_animation = old_worm_folded_animation(old_behemoth_worm_scale, old_behemoth_worm_tint),
    preparing_speed = 0.024,
    preparing_speed_when_killed = 0.024 * preparing_speed_multiplier_when_killed,
    preparing_animation = old_worm_preparing_animation(old_behemoth_worm_scale, old_behemoth_worm_tint, "forward"),
    preparing_sound = sounds.worm_standup(0.7),
    prepared_speed = 0.024,
    prepared_speed_secondary = 0.012,
    prepared_animation = old_worm_prepared_animation(old_behemoth_worm_scale, old_behemoth_worm_tint),
    prepared_sound = sounds.worm_breath_big(0.6, 0.9),
    prepared_alternative_speed = 0.014,
    prepared_alternative_speed_secondary = 0.010,
    prepared_alternative_speed_when_killed = 0.014 * prepared_alternative_speed_multiplier_when_killed,
    prepared_alternative_starting_progress_when_killed = prepared_starting_progress_when_killed,
    prepared_alternative_chance = 0.2,
    prepared_alternative_animation = old_worm_prepared_animation(old_behemoth_worm_scale, old_behemoth_worm_tint),
    prepared_alternative_sound = sounds.worm_roar_alternative_big(0.5, 0.8),
    starting_attack_speed = 0.034,
    starting_attack_animation = old_worm_attack_animation(old_behemoth_worm_scale, old_behemoth_worm_tint, "forward"),
    starting_attack_sound = sounds.worm_roars_big(0.6, 0.8),
    starting_attack_speed_when_killed = 0.034 * start_attack_speed_multiplier_when_killed,
    ending_attack_speed = 0.016,
    ending_attack_speed_when_killed = 0.016 * end_attack_speed_multiplier_when_killed,
    ending_attack_starting_progress_when_killed = end_attack_starting_progress_when_killed,
    ending_attack_animation = old_worm_attack_animation(old_behemoth_worm_scale, old_behemoth_worm_tint, "backward"),
    folding_speed = 0.015,
    folding_speed_when_killed = 0.015 * folding_speed_multiplier_when_killed,
    folding_animation = old_worm_preparing_animation(old_behemoth_worm_scale, old_behemoth_worm_tint, "backward"),
    folding_sound = sounds.worm_fold(1),
    --integration = worm_integration(old_behemoth_worm_scale, true),
    random_animation_offset = true,
    attack_from_start_frame = true,

    prepare_range = range_worm_behemoth + prepare_range_worm_behemoth,
    allow_turning_when_starting_attack = true,
    attack_parameters =
    {
      type = "stream",
      ammo_category = "biological",
      damage_modifier = damage_modifier_worm_behemoth,--defined in spitter-projectiles.lua
      cooldown = 4,
      range = range_worm_behemoth,--defined in spitter-projectiles.lua
      min_range = 0,
      projectile_creation_parameters = worm_shoot_shiftings(old_behemoth_worm_scale, old_behemoth_worm_scale * scale_worm_stream),
      use_shooter_direction = true,

      lead_target_for_projectile_speed = 0.2* 0.75 * 1.5 * 1.5, -- this is same as particle horizontal speed of flamethrower fire stream

      ammo_type =
      {
        action =
        {
          type = "direct",
          action_delivery =
          {
            type = "stream",
            stream = "acid-stream-worm-behemoth",
            source_offset = {0.15, -0.5}
          }
        }
      }
    },
    build_base_evolution_requirement = 0.9,
    autoplace = enemy_autoplace.enemy_worm_autoplace("enemy_autoplace_base(8, 5)"),
    call_for_help_radius = 80,
    spawn_decorations_on_expansion = true,
    spawn_decoration =
    {
      {
        decorative = "worms-decal",
        spawn_min = 1,
        spawn_max = 3,
        spawn_min_radius = 1,
        spawn_max_radius = 5
      },
      {
        decorative = "shroom-decal",
        spawn_min = 1,
        spawn_max = 2,
        spawn_min_radius = 1,
        spawn_max_radius = 2
      },
      {
        decorative = "enemy-decal",
        spawn_min = 1,
        spawn_max = 4,
        spawn_min_radius = 1,
        spawn_max_radius = 4
      },
      {
        decorative = "enemy-decal-transparent",
        spawn_min = 3,
        spawn_max = 5,
        spawn_min_radius = 1,
        spawn_max_radius = 4
      }
    }
  },
  old_worm_corpse("old-small", old_small_worm_scale, old_small_worm_tint,"a"),
  old_worm_corpse_burrowed("old-small", old_small_worm_scale, old_small_worm_tint,"a"),

  old_worm_corpse("old-medium", old_medium_worm_scale, old_medium_worm_tint,"b"),
  old_worm_corpse_burrowed("old-medium", old_medium_worm_scale, old_medium_worm_tint,"b"),

  old_worm_corpse("old-big", old_big_worm_scale, old_big_worm_tint,"c"),
  old_worm_corpse_burrowed("old-big", old_big_worm_scale, old_big_worm_tint,"c"),

  old_worm_corpse("old-behemoth", old_behemoth_worm_scale, old_behemoth_worm_tint,"d"),
  old_worm_corpse_burrowed("old-behemoth", old_behemoth_worm_scale, old_behemoth_worm_tint,"d")
})
