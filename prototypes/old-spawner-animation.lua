local anim_speed = 0.1 --original 0.18


function old_spawner_idle_animation(variation, tint, mask)
  local graph = 
  {
    layers =
    {
      {
        filename = modgraphics .. "entity/spawner/spawner-idle-groundintegration.png",
        flags = { "low-object" },
        line_length = 1,
        repeat_count = 14,
        width = 486,
        height = 362,
        animation_speed = anim_speed,
        direction_count = 1,
        --run_mode = "forward-then-backward",
        shift = util.by_pixel(14, 2),
        y = variation * 362,
        scale = 0.5,
      },
      {
        filename = modgraphics .. "entity/spawner/spawner-idle.png",
        line_length = 8,
        width = 486,
        height = 362,
        frame_count = 8,
        animation_speed = anim_speed,
        direction_count = 1,
        run_mode = "forward-then-backward",
        shift = util.by_pixel(14, 2),
        y = variation * 362,
        scale = 0.5,
      },
      {
        filename = modgraphics .. "entity/spawner/spawner-idle-shadow.png",
        line_length = 8,
        width = 486,
        height = 362,
        frame_count = 8,
        animation_speed = anim_speed,
        direction_count = 1,
        run_mode = "forward-then-backward",
        shift = util.by_pixel(14, 2),
        draw_as_shadow = true,
        y = variation * 362,
        scale = 0.5,
      },
    }
  }

  if mask ~= nil then
    table.insert(graph.layers, 
      {
        filename = modgraphics .. "entity/spawner/spawner-idle-mask.png",
        --flags = { "mask" },
        width = 332,
        height = 296,
        frame_count = 8,
        animation_speed = anim_speed,
        run_mode = "forward-then-backward",
        shift = util.by_pixel(-2, -2),
        line_length = 8,
        --tint = tint,
        y = variation * 296,
        scale = 0.5,
      })
  end
  return graph
end

function old_spawner_die_animation(variation, tint, mask)
  local graph = 
  {
    layers =
    {
      {
        filename = modgraphics .. "entity/spawner/spawner-idle-groundintegration.png",
        flags = { "low-object" },
        line_length = 1,
        repeat_count = 20,
        width = 486,
        height = 362,
        animation_speed = anim_speed,
        direction_count = 1,
        --run_mode = "forward-then-backward",
        shift = util.by_pixel(14, 2),
        y = variation * 362,
        scale = 0.5,
      },
      {
        width = 510,
        height = 368,
        frame_count = 20,
        direction_count = 1,
        shift = util.by_pixel(9, 0.5),
        scale = 0.5,
        stripes =
        {
         {
          filename = modgraphics .. "entity/spawner/spawner-die-01.png",
          width_in_frames = 7,
          height_in_frames = 4,
          y = variation * 368
         },
         {
          filename = modgraphics .. "entity/spawner/spawner-die-02.png",
          width_in_frames = 7,
          height_in_frames = 4,
          y = variation * 368
         },
         {
          filename = modgraphics .. "entity/spawner/spawner-die-03.png",
          width_in_frames = 6,
          height_in_frames = 4,
          y = variation * 368
         }
        }
      },
      {
        width = 510,
        height = 368,
        frame_count = 20,
        direction_count = 1,
        shift = util.by_pixel(9, 0.5),
        scale = 0.5,
        draw_as_shadow = true,
        stripes =
        {
         {
          filename = modgraphics .. "entity/spawner/spawner-die-01-shadow.png",
          width_in_frames = 7,
          height_in_frames = 4,
          y = variation * 368
         },
         {
          filename = modgraphics .. "entity/spawner/spawner-die-02-shadow.png",
          width_in_frames = 7,
          height_in_frames = 4,
          y = variation * 368
         },
         {
          filename = modgraphics .. "entity/spawner/spawner-die-03-shadow.png",
          width_in_frames = 6,
          height_in_frames = 4,
          y = variation * 368
         }
        }
      },
    }
  }
  if mask ~= nil then
    table.insert(graph.layers, 
      {
        width = 332,
        height = 296,
        frame_count = 20,
        direction_count = 1,
        shift = util.by_pixel(-1.5, -2.5),
        scale = 0.5,
        --tint = tint,
        stripes =
        {
         {
          filename = modgraphics .. "entity/spawner/spawner-die-mask-01.png",
          width_in_frames = 10,
          height_in_frames = 4,
          y = variation * 296
         },
         {
          filename = modgraphics .. "entity/spawner/spawner-die-mask-02.png",
          width_in_frames = 10,
          height_in_frames = 4,
          y = variation * 296
         }
        }
      })
  end
  return graph
end

function old_spawner_decay_animation(variation)
  local graph = 
  {
    layers =
    {
      {
        flags = {"corpse-decay"},
        usage = "corpse-decay",
        width = 510,
        height = 368,
        frame_count = 8,
        direction_count = 1,
        shift = util.by_pixel(9, 0.5),
        scale = 0.5,
        stripes =
        {
         {
          filename = modgraphics .. "entity/spawner/spawner-decay.png",
          width_in_frames = 8,
          height_in_frames = 4,
          y = variation * 368
         },
        }
      },
    }
  }
  return graph
end